package airamfsync.models {
  import org.restfulx.collections.ModelsCollection;
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="people")]
  [Bindable]
  public class Person extends RxModel {
    public static const LABEL:String = "firstName";

    public var firstName:String = "";

    public var lastName:String = "";
    
    [HasMany]
    public var addresses:ModelsCollection;

    public function Person() {
      super(LABEL);
    }
  }
}
