namespace Corvus.Domain
{
    /// <summary>IRandom com semente fixa, baseado em System.Random.</summary>
    public sealed class SeededRandom : IRandom
    {
        private readonly System.Random _random;

        public SeededRandom(int seed)
        {
            _random = new System.Random(seed);
        }

        public int Range(int minInclusive, int maxExclusive) => _random.Next(minInclusive, maxExclusive);

        public double NextDouble() => _random.NextDouble();
    }
}
