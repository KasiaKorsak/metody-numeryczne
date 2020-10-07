package edu.kasia;

import javafx.scene.chart.XYChart;

public class Cosinus {

    private double tend;
    private double f;
    private int n;

    public Cosinus(double tend, double f, int n){
        this.tend=tend;
        this.f=f;
        this.n=n;
    }

    public XYChart.Series getValues(){
        XYChart.Series values = new XYChart.Series();

        double dt=tend/(n-1);
        double time=0;

        for(int i=0;i<n;i++){
            values.getData().add(new XYChart.Data(time,Math.cos(2*Math.PI*f*time)));
                    time+=dt;
        }
        return values;
    }


}
