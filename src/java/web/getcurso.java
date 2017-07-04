/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.orm.PersistentException;
import orm.Apoderado;
import orm.ApoderadoDAO;
import orm.Curso;
import orm.CursoDAO;
import orm.Curso_estudiante;
import orm.Curso_estudianteDAO;
import orm.Estudiante;
import orm.EstudianteDAO;
import orm.Persona;

/**
 *
 * @author MauricioGabriel
 */
public class getcurso extends HttpServlet {

    private static String n;
    private static String l;
    private ArrayList<Estudiante> almns;
    private Curso load;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String destino = "alumnos.jsp";
        String accion = request.getParameter("accion");
        try {
            if (accion.equals("carga")) {
                int id = Integer.parseInt((String) request.getParameter("colegio"));
                n = (String) request.getParameter("nivel");
                l = (String) request.getParameter("letra");
                String cond = "letra = '" + l + "' and nivel = " + n + " and institucion_id_fk = " + id;
                load = CursoDAO.loadCursoByQuery(cond, null);
                almns = new ArrayList<>();
                for (Curso_estudiante ce : load.curso_estudiante.toArray()) {
                    almns.add(ce.getEstudiante_id_fk());
                }
            } else if (accion.equals("agrega")) {
                Estudiante nuevo = new Estudiante();
                nuevo.setPersona_id_fk(new Persona());
                nuevo.getPersona_id_fk().setNombre(request.getParameter("nombre"));
                String rut = request.getParameter("rut");
                nuevo.getPersona_id_fk().setRut(rut);
                String agno = request.getParameter("agnoingreso");
                nuevo.setAgnoIngreso(Integer.parseInt(agno));
                nuevo.setMatricula(rut + agno.substring(2));
                String apodStatus = request.getParameter("apod");
                Apoderado apod;
                if (apodStatus.equals("nuevo")) {
                    apod = ApoderadoDAO.createApoderado();
                    apod.setPersona_id_fk(new Persona());
                    apod.getPersona_id_fk().setNombre(request.getParameter("nomApod"));
                    apod.getPersona_id_fk().setRut(request.getParameter("rutApod"));
                    ApoderadoDAO.save(apod);
                } else {
                    int idAP = Integer.parseInt(request.getParameter("apodExiste"));
                    apod = ApoderadoDAO.loadApoderadoByORMID(idAP);
                }
                nuevo.setApoderado_id_fk(apod);
                Curso_estudiante ce = Curso_estudianteDAO.createCurso_estudiante();
                ce.setCurso_id_fk(load);
                ce.setEstudiante_id_fk(nuevo);
                EstudianteDAO.save(nuevo);
                Curso_estudianteDAO.save(ce);
                almns.add(nuevo);
            }
            request.setAttribute("curso", n + "º " + l);
            request.setAttribute("alumnos", almns);
        } catch (PersistentException|NullPointerException|NumberFormatException ex) {
            request.setAttribute("error", ex.toString());
            destino = "error.jsp";
        }
        request.getRequestDispatcher(destino).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
