def ordinal(value):
    suffix = 'th'
    if value in (1, 21, 31):
        suffix = 'st'
    elif value in (2, 22):
        suffix = 'nd'
    elif value in (3, 23):
        suffix = 'rd'
    return f'{value}{suffix}'
