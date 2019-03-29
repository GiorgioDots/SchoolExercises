import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine.Info;
import javax.sound.sampled.FloatControl;
import javax.sound.sampled.FloatControl.Type;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.SourceDataLine;
import javax.sound.sampled.UnsupportedAudioFileException;

public class AePlayWave extends Thread
{
  private String filename;
  private AePlayWave.Position curPosition;
  private final int EXTERNAL_BUFFER_SIZE = 524288;
  



  public AePlayWave(String wavfile)
  {
    filename = wavfile;
    curPosition = AePlayWave.Position.NORMAL;
  }
  
  public AePlayWave(String wavfile, AePlayWave.Position p) {
    filename = wavfile;
    curPosition = p;
  }
  
  public void run()
  {
    File soundFile = new File(filename);
    if (!soundFile.exists()) {
      System.err.println("Wave file not found: " + filename);
      return;
    }
    
    AudioInputStream audioInputStream = null;
    try {
      audioInputStream = AudioSystem.getAudioInputStream(soundFile);
    } catch (UnsupportedAudioFileException e1) {
      e1.printStackTrace();
      return;
    } catch (IOException e1) {
      e1.printStackTrace();
      return;
    }
    
    AudioFormat format = audioInputStream.getFormat();
    SourceDataLine auline = null;
    DataLine.Info info = new DataLine.Info(SourceDataLine.class, format);
    try
    {
      auline = (SourceDataLine)AudioSystem.getLine(info);
      auline.open(format);
    } catch (LineUnavailableException e) {
      e.printStackTrace();
      return;
    } catch (Exception e) {
      e.printStackTrace();
      return;
    }
    
    if (auline.isControlSupported(FloatControl.Type.PAN))
    {
      FloatControl pan = (FloatControl)auline.getControl(FloatControl.Type.PAN);
      if (curPosition == AePlayWave.Position.RIGHT) {
        pan.setValue(1.0F);
      } else if (curPosition == AePlayWave.Position.LEFT) {
        pan.setValue(-1.0F);
      }
    }
    auline.start();
    int nBytesRead = 0;
    byte[] abData = new byte[524288];
    try
    {
      while (nBytesRead != -1) {
        nBytesRead = audioInputStream.read(abData, 0, abData.length);
        if (nBytesRead >= 0)
          auline.write(abData, 0, nBytesRead);
      }
    } catch (IOException e) {
      e.printStackTrace();
      return;
    } finally {
      auline.drain();
      auline.close();
    }
  }
}
