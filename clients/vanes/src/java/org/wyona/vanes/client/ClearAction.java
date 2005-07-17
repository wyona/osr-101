package org.wyona.vanes.client;

import luxor.XulAction;
import luxor.XulInput;

/**
 *
 */
public class ClearAction extends XulAction {

    XulInput input;

    /**
     *
     */
    public ClearAction(XulInput input) {
        super("clear");
        this.input = input;
    }

    /**
     *
     */
    public void execute() {
        System.out.println("Clear input " + input.getText());
        input.setText("");
    }
}
