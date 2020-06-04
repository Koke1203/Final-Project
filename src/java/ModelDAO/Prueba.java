/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Logica.Adicional;
import java.util.List;

/**
 *
 * @author groya
 */
public class Prueba {

    public static void main(String args[]) {
        AdicionalDAO dao = new AdicionalDAO();
        List<Adicional> adicionales = dao.listarAdicionales();
        for (Adicional ad : adicionales) {
            System.out.println(ad.getDescripcion());
        }
    }
}
