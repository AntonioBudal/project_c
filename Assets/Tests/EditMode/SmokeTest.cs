using NUnit.Framework;

namespace Corvus.Tests.EditMode
{
    // Teste trivial para provar que a Unity CLI roda testes EditMode.
    public class SmokeTest
    {
        [Test]
        public void SomaSimples()
        {
            Assert.AreEqual(2, 1 + 1);
        }
    }
}
