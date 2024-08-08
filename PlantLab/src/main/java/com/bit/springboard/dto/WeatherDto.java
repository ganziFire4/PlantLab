package com.bit.springboard.dto;

public class WeatherDto {
    private int temperature;
    private int percentage;
    private String quantity;

    public int getTemperature() {
        return temperature;
    }

    public void setTemperature(int temperature) {
        this.temperature = temperature;
    }

    public int getPercentage() {
        return percentage;
    }

    public void setPercentage(int percentage) {
        this.percentage = percentage;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "WeatherDto{" +
                "temperature=" + temperature +
                ", percentage=" + percentage +
                ", quantity='" + quantity + '\'' +
                '}';
    }
}
