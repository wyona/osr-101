package org.wyona.vanes.client;

import javax.swing.JTextField;
import luxor.XulForm;
import luxor.XulInput;

/**
 *
 */
public class VanesForm extends XulForm {
    XulInput searchInput;

    /**
     *
     */
    public VanesForm() {
        super("root");
        setup();
    }

    /**
     *
     */
    public void init() {
        searchInput = new XulInput(this, "search");
        new SearchAction(searchInput);
        new ClearAction(searchInput);
    }

    /**
     *
     */
    public void postInit() {
        JTextField jdisplay = (JTextField) searchInput.getJComponent();
        jdisplay.setHorizontalAlignment(JTextField.LEFT);
        //jdisplay.setHorizontalAlignment(JTextField.RIGHT);
        searchInput.setText("Hello Michi");
    }
}
