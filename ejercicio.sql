-- Active: 1709124310200@@127.0.0.1@3306@si

SHOW DATABASES;

CREATE TABLE marcas (
    idMarca INT PRIMARY KEY AUTO_INCREMENT, 
    marca VARCHAR(45)
);

CREATE TABLE tipo_vehiculo (
    idTipo INT PRIMARY KEY AUTO_INCREMENT,
    tipo_vehiculo VARCHAR(45),
    marcaId INT,
    FOREIGN KEY (marcaId) REFERENCES marcas(idMarca)
);

CREATE TABLE colores (
    idColor INT PRIMARY KEY AUTO_INCREMENT, 
    color VARCHAR(45)
);

CREATE TABLE vehiculos (
    idVehiculo INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(45),
    placa VARCHAR(45) UNIQUE,
    colorId INT,
    tipoVehiculoId INT,
    FOREIGN KEY (colorId) REFERENCES colores(idColor),
    FOREIGN KEY (tipoVehiculoId) REFERENCES tipo_vehiculo(idTipo)
);

SELECT * FROM vehiculos;

SELECT vehiculos.placa, colores.color 
FROM vehiculos 
INNER JOIN colores 
WHERE vehiculos.colorId = colores.idColor;


SELECT vehiculos.idVehiculo, vehiculos.placa, tipo_vehiculo.tipo_vehiculo  
FROM vehiculos 
INNER JOIN tipo_vehiculo 
ON vehiculos.tipoVehiculoId = tipo_vehiculo.idTipo;


SELECT vehiculos.placa, colores.color, tipo_vehiculo.tipo_vehiculo, marcas.marca
FROM vehiculos 
INNER JOIN colores ON vehiculos.colorId = colores.idColor
INNER JOIN tipo_vehiculo ON vehiculos.tipoVehiculoId = tipo_vehiculo.idTipo
INNER JOIN marcas ON tipo_vehiculo.marcaId = marcas.idMarca;