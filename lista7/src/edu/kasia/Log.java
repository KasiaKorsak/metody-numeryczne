package edu.kasia;

import javafx.scene.chart.XYChart;

public class Log {

    private double tend;
    private double a;
    private int n;

    public Log(double tend, double a, int n){
        this.tend=tend;
        this.a=a;
        this.n=n;
    }

    public XYChart.Series getValues(){
        XYChart.Series values = new XYChart.Series();

        double dt=tend/(n-1);
        double x=0.1;

        for(int i=0;i<n;i++){
            values.getData().add(new XYChart.Data(x,Math.log(x)/Math.log(a)));
            x+=dt;
        }
        return values;
    }


}
