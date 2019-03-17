package com.lfs.mall.domain.vo;

import lombok.Data;

import java.util.Objects;

@Data
public class EntryVO implements Comparable<EntryVO> {
    private Integer id;
    private Integer cnt;

    public EntryVO(Integer id, Integer cnt) {
        this.id = id;
        this.cnt = cnt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EntryVO entryVO = (EntryVO) o;
        return Objects.equals(id, entryVO.id) &&
                Objects.equals(cnt, entryVO.cnt);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, cnt);
    }

    @Override
    public int compareTo(EntryVO o) {
        return this.cnt - o.cnt;
    }
}
