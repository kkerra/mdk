using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lection28._03
{
    internal class SensorController
    {
        private Sensor model;
        private SensorView view;

        public SensorController(Sensor sensor, SensorView sensorView)
        {
            this.model = sensor;
            this.view = sensorView;
        }

        public int Temperature
        {
            get => model.Temperature;
            set => model.Temperature = value;
        }

        public int Humidity
        {
            get => model.Humidity;
            set => model.Humidity = value;
        }

        public void UpdateView()
            => view.PrintInfo(Temperature, Humidity);
    }
}
