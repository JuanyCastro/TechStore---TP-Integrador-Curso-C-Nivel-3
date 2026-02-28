using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace dominio
{
    public class Articulo
    {
        public int Id { get; set; }
        [DisplayName("Código")]
        public string Codigo { get; set; }
        public string Nombre { get; set; }

        [DisplayName("Descripción")]
        public string Descripcion { get; set; }
        public string ImagenUrl { get; set; }

        [DisplayName("Marca")]
        public Marca MarcaArticulo { get; set; }

        [DisplayName("Categoría")]
        public Categoria CategoriaArticulo { get; set; }

        private decimal _precio;

        public decimal Precio
        {
            get { return _precio; }
            set { _precio = value; }
        }

        [DisplayName("Precio")]
        public string PrecioFormateado
        {
            get { return Math.Round(_precio, 2).ToString("C", CultureInfo.CreateSpecificCulture("es-AR")); }
        }

        public class Marca
        {
            public int Id { get; set; }
            public string Descripcion { get; set; }
            public override string ToString() => Descripcion;
        }

        public class Categoria
        {
            public int Id { get; set; }
            public string Descripcion { get; set; }
            public override string ToString() => Descripcion;
        }

    }
}
