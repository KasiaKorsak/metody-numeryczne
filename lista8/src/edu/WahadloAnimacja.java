package edu;

import javafx.animation.PathTransition;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.chart.XYChart;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.Slider;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.scene.shape.LineTo;
import javafx.scene.shape.MoveTo;
import javafx.scene.shape.Path;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.util.Duration;

import java.util.ArrayList;

public class WahadloAnimacja {

    private double A;
    private double f;
    private double c;
    private static double theta0;
    private double t0;
    private double h;
    private double tend;
    private double omega0;

    public static ArrayList<Double> thetaList;
    public static ArrayList<Double> timeList;

    public WahadloAnimacja() {
        c = 0.5;
        f = 1;
        A = 0.5;
        theta0 = 5;
        omega0 = 0;
        t0 = 0;
        tend = 100;
        h = 0.01;
    }

    public void display() {
        Stage window = new Stage();
        window.setTitle("Parameters");
        window.initModality(Modality.APPLICATION_MODAL); //okresla czy okno ktore zostalo otwarte blokuje ekran glowny ekranu

        Label label_c = new Label("c: ");
        Label label_a = new Label("A [radiany]: ");
        Label label_f = new Label("f [Hz]: ");
        Label label_theta = new Label("theta [stopnie]: ");
        Label label_t0 = new Label("t0 [s]: ");
        Label label_tend = new Label("tend [s]: ");
        Label label_omega = new Label("omega [rad/s]: ");
        Label label_h = new Label("h: ");

        TextField theta = new TextField(Double.toString(theta0));
        theta.setEditable(true);
        TextField omega = new TextField(Double.toString(omega0));
        omega.setEditable(true);
        TextField tstart = new TextField(Double.toString(t0));
        tstart.setEditable(true);
        TextField tstop = new TextField(Double.toString(tend));
        tstop.setEditable(true);
        TextField stepH = new TextField(Double.toString(h));
        stepH.setEditable(true);


        Slider sliderC = new Slider(0, 0.5, c);
        sliderC.setShowTickLabels(true);
        sliderC.setShowTickMarks(true);
        sliderC.setMajorTickUnit(0.1);
        sliderC.setPadding(new Insets(10));
        sliderC.setMinorTickCount(3);
        sliderC.setBlockIncrement(0.05);
        sliderC.setSnapToTicks(true);

        TextField txt_c = new TextField(Double.toString(c));

        sliderC.valueProperty().addListener(new ChangeListener<Number>() {
            @Override
            public void changed(ObservableValue<? extends Number> observable, Number oldValue, Number newValue) {

                txt_c.setText(Double.toString(newValue.doubleValue()));
            }
        });

        Slider sliderA = new Slider(0, 2, A);
        sliderA.setShowTickLabels(true);
        sliderA.setShowTickMarks(true);
        sliderA.setMajorTickUnit(0.5);
        sliderA.setPadding(new Insets(10));
        sliderA.setMinorTickCount(3);
        sliderA.setBlockIncrement(0.1);
        sliderA.setSnapToTicks(true);

        TextField txt_a = new TextField(Double.toString(A));
        sliderA.valueProperty().addListener(new ChangeListener<Number>() {
            @Override
            public void changed(ObservableValue<? extends Number> observable, Number oldValue, Number newValue) {
                txt_a.setText(Double.toString(newValue.doubleValue()));
            }
        });

        Slider sliderF = new Slider(0, 2, f);
        sliderF.setShowTickLabels(true);
        sliderF.setShowTickMarks(true);
        sliderF.setMajorTickUnit(0.5);
        sliderF.setPadding(new Insets(10));
        sliderF.setMinorTickCount(3);
        sliderF.setBlockIncrement(0.1);
        sliderF.setSnapToTicks(true);

        TextField txt_f = new TextField(Double.toString(f));
        sliderF.valueProperty().addListener(new ChangeListener<Number>() {
            @Override
            public void changed(ObservableValue<? extends Number> observable, Number oldValue, Number newValue) {
                txt_f.setText(Double.toString(newValue.doubleValue()));
            }
        });

        //

        Button btnSet = new Button("Set");
        btnSet.setPrefWidth(100);
        btnSet.setOnAction(e -> {
            c = Double.parseDouble(txt_c.getText());
            A = Double.parseDouble(txt_a.getText());
            f = Double.parseDouble(txt_f.getText());
            theta0 = Double.parseDouble(theta.getText());
            omega0 = Double.parseDouble(omega.getText());
            t0 = Double.parseDouble(tstart.getText());
            tend = Double.parseDouble(tstop.getText());
            h = Double.parseDouble(stepH.getText());
            window.close();
        });
        btnSet.setAlignment(Pos.CENTER);

        HBox hboxC = new HBox(label_c, sliderC, txt_c);
        hboxC.setAlignment(Pos.CENTER);
        HBox hboxA = new HBox(label_a, sliderA, txt_a);
        hboxA.setAlignment(Pos.CENTER);
        HBox hboxF = new HBox(label_f, sliderF, txt_f);
        hboxF.setAlignment(Pos.CENTER);
        HBox hboxtheta = new HBox(label_theta, theta);
        hboxtheta.setAlignment(Pos.CENTER);
        HBox hboxomega = new HBox(label_omega, omega);
        hboxomega.setAlignment(Pos.CENTER);
        HBox HBt0 = new HBox(label_t0, tstart);
        HBt0.setAlignment(Pos.CENTER);
        HBox HBtend = new HBox(label_tend, tstop);
        HBtend.setAlignment(Pos.CENTER);
        HBox HBh = new HBox(label_h, stepH);
        HBh.setAlignment(Pos.CENTER);


        VBox vbox = new VBox(20, hboxC, hboxA, hboxF, hboxtheta, hboxomega, HBt0, HBtend, HBh, btnSet);

        Scene scene = new Scene(vbox, 400, 650);
        window.setScene(scene);

        window.showAndWait(); //bo okno modalne

    }


    public WahadloAnimacja(double c, double a, double f) {
        this.c = c;
        this.A = a;
        this.f = f;
    }

    public double getC() {
        return c;
    }

    public double getA() {
        return A;
    }

    public double getF() {
        return f;
    }

    public double getTheta0() {
        return theta0;
    }

    public double getT0() {
        return t0;
    }

    public double getH() {
        return h;
    }

    public double getTend() {
        return tend;
    }

    public double getOmega0() {
        return omega0;
    }

    public WahadloAnimacja(double A, double f, double c, double theta0, double t0, double h, double tend, double omega0) {
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

        thetaList = new ArrayList<>();
        timeList = new ArrayList<>();

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

            thetaList.add(theta);
            timeList.add(t);
        }
        daneOut.add(values);
        daneOut.add(values2);
        daneOut.add(values3);
        return daneOut;

    }

    public void drawAnimation(){

        Stage stage=new Stage();
        double xc=250f;
        double yc=250f;
        double r=150f;

        Circle circle = new Circle();

        circle.setCenterX(xc+r*Math.sin(theta0));
        circle.setCenterY(yc+r*Math.cos(theta0));

        circle.setRadius(25.0);

        circle.setFill(Color.ROSYBROWN);

        circle.setStrokeWidth(20);

        Path path = new Path();
        path.getElements().add(new MoveTo(xc+r*Math.sin(theta0),yc+r*Math.cos(theta0)));


        for(int i=0;i<thetaList.size();i++){
            double x=xc+r*Math.sin(thetaList.get(i));
            double y=yc+r*Math.cos(thetaList.get(i));

            path.getElements().add(new LineTo(x,y));
        }

        PathTransition pathTransition = new PathTransition();

        pathTransition.setDuration(Duration.seconds(tend));

        pathTransition.setNode(circle);

        pathTransition.setPath(path);

        pathTransition.setOrientation(PathTransition.OrientationType.ORTHOGONAL_TO_TANGENT);

        pathTransition.setCycleCount(1);

        pathTransition.setAutoReverse(true);

        pathTransition.play();

        Group root = new Group(circle);

        Scene scene = new Scene(root,500,500);

        stage.setTitle("Animation");

        stage.setScene(scene);

        stage.show();

    }

}