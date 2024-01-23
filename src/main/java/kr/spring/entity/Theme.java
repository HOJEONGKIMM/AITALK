package kr.spring.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString
public class Theme {

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long theme_idx;
    private String language;
    private String title;
    private String url;
    
    @Lob // 이 어노테이션을 사용하여 TEXT 타입으로 매핑
    @Column
    private String caption;
    
    @Lob // 이 어노테이션을 사용하여 TEXT 타입으로 매핑
    @Column
    private String translate;
     
}
