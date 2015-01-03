# converts to celcius given farenheit
def ftoc(far)
    return (far - 32) * (5.0 / 9.0)
end

# converts to farenheit given celcius
def ctof(cel)
    return cel * 9.0 / 5.0 + 32
end
