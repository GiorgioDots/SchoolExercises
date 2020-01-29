package beans;

public class GetWord implements java.io.Serializable {
	private SQLHandler handler;
	private String word = "";

	public GetWord() {
		handler = new SQLHandler();
	}

	public String getWord() {
		return handler.selectQuery("select * from dictionary where word = '" + word + "'");
	}

	public void setWord(String val) {
		this.word = val;
	}

}