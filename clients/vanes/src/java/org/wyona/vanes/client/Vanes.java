package org.wyona.vanes.client;

import javax.swing.*;

/**
 *
 */
public class Vanes {

    /**
     *
     */
    public static void main(String[] args) {
        new Vanes(null);
    }

    /**
     *
     */
    public Vanes(String url) {
        System.out.println("Starting vanese ...");

        JFrame.setDefaultLookAndFeelDecorated(true);
        JFrame frame = new JFrame("VanesSwing");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JLabel label = new JLabel("Hello Vanes");
        frame.getContentPane().add(label);
        frame.pack();
        frame.setVisible(true);
    }
}
