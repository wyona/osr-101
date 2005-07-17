package org.wyona.vanes.client;

import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;

import javax.swing.JFrame;
import javax.swing.UIManager;
import luxor.XulManager;
import luxor.core.loader.ChromeFileResourceLoader;
import luxor.spi.ChromeResourceLoader;

public class VanesLuxor extends JFrame {

    /**
     *
     */
    public static void main(String argv[]) {
        try {
            if(argv.length != 1){
                System.out.println("Usage : java org.wyona.vanes.client.VanesLuxor pathtoStartupParentDir	");
                System.out.println("for instance, if your xul files are in ~/calculator/src/startup/ directory");
                System.out.println("then pathtoStartupParentDir is ~/calculator/src");
                return;
            }

            UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
        } catch (Exception e) {
            System.err.println(e);
        }

        new VanesLuxor(argv[0]);
    }

    /**
     *
     */
    public VanesLuxor(String startupDirPath) {
        super("Vanes Editor");

        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }
        });

        File rootPath = new File(startupDirPath);
        ChromeResourceLoader xrl = new ChromeFileResourceLoader(rootPath);
        System.out.println(xrl);
        XulManager xul = XulManager.getXulManager();
        xul.setResourceLoader(xrl);
        xul.load();
        getContentPane().add(new org.wyona.vanes.client.VanesForm().getJComponent());
        pack();
        setVisible(true);
    }
}
