package beans;

public class UpdateWord implements java.io.Serializable {
	private String meaning = "";
	private SQLHandler handler;

	public UpdateWord() {
		handler = new SQLHandler();
	}

	public void setMeaning(String val) {
		this.meaning = val;
	}

	public void setWord(String val) {
		handler.updateQuery("UPDATE `dictionary` SET meaning = '" + this.meaning + "' WHERE word='" + val + "'");
	}
}