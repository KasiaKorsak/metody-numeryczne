package edu.kasia;

import javafx.scene.chart.XYChart;

import java.util.ArrayList;

public class Wahadlo {

    private double A;
    private double f;
    private double c;
    private double theta0;
    private double t0;
    private double h;
    private double tend;
    private double omega0;


    public Wahadlo(double A, double f, double c, double theta0, double t0, double h, double tend, double omega0) {
        this.A = A;
        this.f = f;
        this.c = c;
        this.theta0 = theta0;
        this.t0 = t0;
        this.h = h;
        this.tend = tend;
        this.omega0 = omega0;
    }

    public ArrayList<XYChart.Series> getValues() {
        XYChart.Series values = new XYChart.Series();
        XYChart.Series values2 = new XYChart.Series();
        XYChart.Series values3 = new XYChart.Series();

        ArrayList<XYChart.Series> daneOut = new ArrayList();

        double t = t0;
        double theta = theta0;
        double omega = omega0;
        double n = Math.floor((tend - t0) / h);

        for (int i = 1; i < n; i++) {
            double thetaOld = theta;

            double tMid = t + h / 2;
            double thetaMid = theta + h / 2 * omega;
            double omegaMid = omega - Math.sin(thetaOld) * h / 2 - c * omega * h / 2 + A * Math.sin(t * f) * h / 2;

            theta = theta + h * omegaMid;

            omega = omega - Math.sin(thetaMid) * h - c * omegaMid * h + A * Math.sin(tMid * f) * h;

            t = t + h;

            values.getData().add(new XYChart.Data(t, theta));

            values2.getData().add(new XYChart.Data<>(t, omega));

            values3.getData().add(new XYChart.Data<>(theta, omega));

        }
        daneOut.add(values);
        daneOut.add(values2);
        daneOut.add(values3);

        return daneOut;

    }

}
