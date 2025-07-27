/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jbcrypt;

import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author informatica
 */
public class Encriptar {

    public static String encriptar(String contrasena) {
        return BCrypt.hashpw(contrasena, BCrypt.gensalt());
    }
    

    public static Boolean verificarContrasena(String contrasenaAVerificar, String hash) {
        return BCrypt.checkpw(contrasenaAVerificar, hash);
    }
}