package beans;

public class DeleteWord implements java.io.Serializable {

	private SQLHandler handler;

	public DeleteWord() {
		handler = new SQLHandler();
	}

	public void setWord(String val) {
		handler.updateQuery("DELETE FROM `dictionary` WHERE word='" + val + "'");
	}
}