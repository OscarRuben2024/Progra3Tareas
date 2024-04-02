package busquedabinaria;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Arrays;

public class ejerciciobinario extends JFrame {

    private JTextField inputField;
    private JTextField searchField;
    private JTextArea outputTextArea;

    private int[] datos = new int[10];
    private int index = 0;

    public ejerciciobinario() {
        setTitle("Búsqueda Binaria - GUI");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        inputField = new JTextField();
        searchField = new JTextField();
        outputTextArea = new JTextArea();
        JButton ingresarButton = new JButton("Ingresar");
        JButton ordenarButton = new JButton("Ordenar Datos");
        JButton mostrarButton = new JButton("Mostrar Datos");
        JButton borrarButton = new JButton("Borrar Datos");
        JButton buscarButton = new JButton("Buscar");
        JButton iteracionButton = new JButton("Buscar Iteración");

        setLayout(new BorderLayout());
        outputTextArea.setEditable(false);

        inputField.setColumns(20);

        searchField.setColumns(10);

        JPanel inputPanel = new JPanel(new FlowLayout());
        inputPanel.add(new JLabel("Ingresar Datos: "));
        inputPanel.add(inputField);
        inputPanel.add(ingresarButton);
        add(inputPanel, BorderLayout.NORTH);

        JPanel searchPanel = new JPanel(new FlowLayout());
        searchPanel.add(new JLabel("Buscar Valor: "));
        searchPanel.add(searchField);
        searchPanel.add(buscarButton);
        add(searchPanel, BorderLayout.WEST);

        JPanel buttonPanel = new JPanel(new FlowLayout());
        buttonPanel.add(ordenarButton);
        buttonPanel.add(mostrarButton);
        buttonPanel.add(iteracionButton);
        buttonPanel.add(borrarButton);
        add(buttonPanel, BorderLayout.CENTER);

        add(new JScrollPane(outputTextArea), BorderLayout.SOUTH);

        ingresarButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ingresarDato();
            }
        });

        ordenarButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ordenarDatos();
            }
        });

        mostrarButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                mostrarDatos();
            }
        });

        borrarButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                borrarDatos();
            }
        });

        buscarButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                buscarValor();
            }
        });
        iteracionButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                buscarConIteraciones();
            }
        });
    }

    private void ingresarDato() {
        if (index < 10) {
            try {
                int dato = Integer.parseInt(inputField.getText());
                datos[index++] = dato;
                inputField.setText("");
                outputTextArea.append("Dato ingresado: " + dato + "\n");
            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(this, "Ingrese un número válido.");
            }
        } else {
            JOptionPane.showMessageDialog(this, "Ya se ingresaron 10 datos.");
        }
    }

    private void ordenarDatos() {
        Arrays.sort(datos);
        outputTextArea.append("Datos ordenados: " + Arrays.toString(datos) + "\n");
    }

    private void mostrarDatos() {
        outputTextArea.append("Datos ingresados: " + Arrays.toString(datos) + "\n");
    }

    private void borrarDatos() {
        Arrays.fill(datos, 0);
        index = 0;
        outputTextArea.setText("Datos borrados.\n");
    }

    int iteraciones = 0;
    
    private void buscarValor() {
        try {
            int valorBuscado = Integer.parseInt(searchField.getText());
            int resultado = busquedaBinaria(datos, valorBuscado);

            if (resultado == -1)
                outputTextArea.append("Elemento " + valorBuscado + " no encontrado en el array\n");
            else
                outputTextArea.append("Elemento " + valorBuscado + " encontrado en la posición " + resultado +
                        ". El valor en esta posición es " + datos[resultado] + "\n");
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(this, "Ingrese un número válido para buscar.");
        }
    }
    
    private void buscarConIteraciones() {
    try {
        int valorBuscado = Integer.parseInt(searchField.getText());
        int resultado = busquedaBinariaConIteraciones(datos, valorBuscado);

        if (resultado == -1)
            outputTextArea.append("Elemento " + valorBuscado + " no encontrado en el array\n");
        else
            outputTextArea.append("Elemento " + valorBuscado + " encontrado en la posición " + resultado +
                    ". El valor en esta posición es " + datos[resultado] + "\n");
    } catch (NumberFormatException e) {
        JOptionPane.showMessageDialog(this, "Ingrese un número válido para buscar.");
    }
}


    private int busquedaBinaria(int[] arr, int x) {
        int inicio = 0, fin = arr.length - 1;
        while (inicio <= fin) {
            iteraciones++;
            
            int medio = inicio + (fin - inicio) / 2;
            if (arr[medio] == x){
                outputTextArea.append("Número de iteraciones " + iteraciones + "\n");
                return medio;
            }
            else if (arr[medio] < x)
                inicio = medio + 1;
            else
                fin = medio - 1;

            outputTextArea.append("Comparando con valor en posición " + medio +
                    ": El valor buscado es " + (arr[medio] >= x ? "mayor o igual" : "menor") + "\n");
        }
        outputTextArea.append("Número de iteraciones " + iteraciones + "\n");
        return -1;
    }
    
    private int busquedaBinariaConIteraciones(int[] arr, int x) {
    int inicio = 0, fin = arr.length - 1;
    int iteraciones = 0; 
    while (inicio <= fin) {
        iteraciones++;
        
        int medio = inicio + (fin - inicio) / 2;
        if (arr[medio] == x){
            outputTextArea.append("Número de iteraciones " + iteraciones + "\n");
            return medio;
        }
        else if (arr[medio] < x)
            inicio = medio + 1;
        else
            fin = medio - 1;

        
    }
    outputTextArea.append("Número de iteraciones " + iteraciones + "\n");
    return -1;
}


    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                ejerciciobinario gui = new ejerciciobinario();
                gui.setVisible(true);
            }
        });
    }
}

