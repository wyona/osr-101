package org.wyona.vanes.client;

import javax.swing.*;

/**
 *
 */
public class VanesSwing {

    /**
     *
     */
    public static void main(String[] args) {
        new VanesSwing(null);
    }

    /**
     *
     */
    public VanesSwing(String url) {
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
