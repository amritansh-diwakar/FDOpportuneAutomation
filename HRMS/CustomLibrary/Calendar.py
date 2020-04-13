from datetime import date, timedelta


def get_current_month():
    return date.today().strftime('%b')


def get_previous_month():
    return (date.today().replace(day=1) - timedelta(days=1)).strftime('%b')
