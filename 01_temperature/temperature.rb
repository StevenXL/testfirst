# converts to celcius given farenheit
def ftoc(far)
    (far - 32) * (5.0 / 9.0)
end

# converts to farenheit given celcius
def ctof(cel)
    cel * 9.0 / 5.0 + 32
end
