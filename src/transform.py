from datetime import datetime, timedelta


def _to_float(value):
    """
    Function to convert strings to floats
    """
    # Handle missing values or placeholders
    if value is None or value == 'Ip':
        return None
    
    # Replace comma with dot for European decimal format, then cast to float
    v = float(value.replace(',', '.') if isinstance(value, str) else value)

    # Round to 2 decimal places
    return round(v, 2)


def _to_int(value):
    """
    Function to convert strings to integers
    """
    if value is None or value == 'Ip':
        return None
    return int(value)


def transform_meteo(raw_json, city_id, date):
    """
    Clean and reshape daily meteorological observations into a flat dict.

    Parameters:
        raw_json (list of dict): List containing one dict of daily stats.
        city_id: Identifier for the city.
        date (datetime): Date for which data was fetched.

    Returns:
        dict with selected metrics (rounded where appropriate), or None if input invalid.
    """
    # Validate input: expect a non-empty list
    if not raw_json or not isinstance(raw_json, list) or len(raw_json) == 0:
        return None
    
    d0 = raw_json[0]
    
    return {
        'city_id': city_id,
        'date': date.strftime('%Y-%m-%d'),
        'precipitation': _to_float(d0.get('prec')),
        'temperature_avg': round(_to_float(d0.get('tmed'))) if _to_float(d0.get('tmed')) is not None else None,
        'temperature_max': round(_to_float(d0.get('tmax'))) if _to_float(d0.get('tmax')) is not None else None,
        'temperature_min': round(_to_float(d0.get('tmin'))) if _to_float(d0.get('tmin')) is not None else None,
        'humidity_avg': _to_int(d0.get('hrMedia')),
        'humidity_max': _to_int(d0.get('hrMax')),
        'humidity_min': _to_int(d0.get('hrMin'))
    }


def transform_prediction(raw_json, city_id):
    """
    Clean and reshape hourly forecast for the next day into summary metrics.

    Parameters:
        raw_json (list of dict): AEMET forecast response, with 'prediccion' key.
        city_id: Identifier for the municipality.

    Returns:
        dict summarizing tomorrow's temperature and humidity extremes and averages,
        plus precipitation and storm probabilities, or None on invalid input.
    """
    # Basic validation: need at least one element with 'prediccion'
    if not raw_json or not isinstance(raw_json, list) or len(raw_json) == 0:
        return None
    pred = raw_json[0].get('prediccion', {})
    days = pred.get('dia', []) # List of day-wise forecasts

    # Expect today's (0) and tomorrow's (1) entries
    if len(days) < 2:
        return None
    
    tomorrow = days[1]

    # Extract lists of hourly temperature and humidity readings
    temps = tomorrow.get('temperatura', []) or []
    hums = tomorrow.get('humedadRelativa', []) or []

    # Convert string values to floats for aggregation
    temp_vals = [float(t['value']) for t in temps]
    hum_vals = [float(h['value']) for h in hums]
    
    return {
        'city_id': city_id,
        'date': (datetime.now() + timedelta(days=1)).strftime('%Y-%m-%d'),
        'temperature_max': max(temp_vals) if temp_vals else None,
        'temperature_min': min(temp_vals) if temp_vals else None,
        'temperature_avg': round(sum(temp_vals)/len(temp_vals)) if temp_vals else None,
        'humidity_max': max(hum_vals) if hum_vals else None,
        'humidity_min': min(hum_vals) if hum_vals else None,
        'humidity_avg': round(sum(hum_vals)/len(hum_vals)) if hum_vals else None,
        'precipitations': tomorrow.get('precipitacion'),
        'prob_precipitation': tomorrow.get('probPrecipitacion'),
        'prob_storm': tomorrow.get('probTormenta')
    }
