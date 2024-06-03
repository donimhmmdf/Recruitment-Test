import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

/**
 * No3
 */
public class No3 {

  public static void main(String[] args) {
    LocalDate tanggalPinjam = LocalDate.of(2024, 5, 1);
    LocalDate tanggalKembali = LocalDate.of(2024, 7, 1);
    String[] buku = { "Buku 1", "Buku 2", "Buku 3" };
    int batasMaxPinjaman = 14;
    int dendaHarian = 1000;
    int dendaMaximum = 30000;

    solution(
      tanggalKembali,
      tanggalPinjam,
      buku,
      batasMaxPinjaman,
      dendaHarian,
      dendaMaximum
    );
  }

  public static void solution(
    LocalDate tanggalKembali,
    LocalDate tanggalPinjam,
    String[] buku,
    int batasMaxPinjaman,
    int dendaHarian,
    int dendaMaximum
  ) {
    double totalDenda = 0;
    double[] dendaPerBuku = new double[buku.length];

    long lamaPinjam = ChronoUnit.DAYS.between(tanggalPinjam, tanggalKembali);

    for (int i = 0; i < buku.length; i++) {
      int denda = 0;
      if (lamaPinjam > batasMaxPinjaman) {
        long telat = lamaPinjam - batasMaxPinjaman;
        denda = (int) telat * dendaHarian;

        if (denda > dendaMaximum) {
          denda = dendaMaximum;
        }
      }
      dendaPerBuku[i] = denda;
      totalDenda += denda;
    }
    System.out.print("Buku: ");
    for (String b : buku) {
      System.out.print(b + " ");
    }
    System.out.println();
    System.out.println("Lama pinjam  : " + lamaPinjam + " hari");
    for (int i = 0; i < buku.length; i++) {
      System.out.println("Denda " + buku[i] + " : Rp" + dendaPerBuku[i]);
    }
    System.out.println("Total denda  : " + "Rp" + totalDenda);
  }
}
