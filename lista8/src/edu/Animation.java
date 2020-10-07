package edu;

import javafx.animation.PathTransition;
import javafx.application.Application;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.scene.shape.LineTo;
import javafx.scene.shape.MoveTo;
import javafx.scene.shape.Path;
import javafx.stage.Stage;
import javafx.util.Duration;

public class Animation extends Application {
    @Override
    public void start(Stage primaryStage) throws Exception {

        double xc=250f;
        double yc=250f;
        double r=150f;

        Circle circle = new Circle();

        circle.setCenterX(xc+r);
        circle.setCenterY(yc);

        circle.setRadius(25.0);

        circle.setFill(Color.BROWN);

        circle.setStrokeWidth(20);

        Path path = new Path();
        path.getElements().add(new MoveTo(xc+r,yc));

        int n=200;
        double theta=0;
        double dTheta=2*Math.PI/(n-1);
        for(int i=0;i<n;i++){
            double x=xc+r*Math.cos(theta);
            double y=yc+r*Math.sin(theta);
            System.out.println("x= " + x + "y= " + y);

            path.getElements().add(new LineTo(x,y));
            theta+=dTheta;
        }

        PathTransition pathTransition = new PathTransition();

        pathTransition.setDuration(Duration.millis(9000));

        pathTransition.setNode(circle);

        pathTransition.setPath(path);

        pathTransition.setOrientation(PathTransition.OrientationType.ORTHOGONAL_TO_TANGENT);

        pathTransition.setCycleCount(1);

        pathTransition.setAutoReverse(false);

        pathTransition.play();

        Group root = new Group(circle);

        Scene scene = new Scene(root,500,500);

        primaryStage.setTitle("Path transition example");

        primaryStage.setScene(scene);

        primaryStage.show();



    }

    public static void main(String[] args) {
        launch(args);
    }

}
