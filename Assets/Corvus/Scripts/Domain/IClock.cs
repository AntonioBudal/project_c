namespace Corvus.Domain
{
    /// <summary>Fonte de tempo injetada, para que regras do jogo sejam testáveis.</summary>
    public interface IClock
    {
        /// <summary>Segundos de jogo desde o início.</summary>
        double Now { get; }
    }
}
