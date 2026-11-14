using Corvus.Domain;
using NUnit.Framework;

namespace Corvus.Tests.EditMode
{
    public class SeededRandomTests
    {
        [Test]
        public void MesmaSemente_MesmaSequencia()
        {
            var a = new SeededRandom(42);
            var b = new SeededRandom(42);
            for (int i = 0; i < 10; i++)
            {
                Assert.AreEqual(a.Range(0, 1000), b.Range(0, 1000));
            }
        }

        [Test]
        public void Range_FicaDentroDosLimites()
        {
            var r = new SeededRandom(7);
            for (int i = 0; i < 100; i++)
            {
                int v = r.Range(3, 6);
                Assert.That(v, Is.InRange(3, 5));
            }
        }
    }
}
