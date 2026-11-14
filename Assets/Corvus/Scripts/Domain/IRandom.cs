namespace Corvus.Domain
{
    /// <summary>Fonte de aleatoriedade injetada, para que testes sejam determinísticos.</summary>
    public interface IRandom
    {
        /// <summary>Inteiro em [minInclusive, maxExclusive).</summary>
        int Range(int minInclusive, int maxExclusive);

        /// <summary>Valor em [0, 1).</summary>
        double NextDouble();
    }
}
