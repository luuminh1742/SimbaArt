package com.simbaart.utils;

import com.simbaart.dto.PhotoPostsDTO;
import org.springframework.stereotype.Component;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;


/**
 * Divide images by columns
 * <br/>
 * <i>Created date : 28/02/2021</i>
 * @author Minh
 */
@Component
public class SortImageUtil {


    /**
     * Phương thức <b>sắp xếp</b> các ảnh vào các cột
     * <br/>
     * <b>Nguyên lý hoạt dộng:</b> <br/>
     * - Tạo một list min height của các cột.<br/>
     * - Duyệt danh sách hình ảnh và đưa các ảnh vào các cột có chiều cao min và cập nhật lại list min height
     * <br/>
     * <i>Created date : 28/02/2021 </i>
     * @param model Chứa danh sách các ảnh
     * @param model1 Dùng để lưu trữ các ảnh ở cột 1
     * @param model2 DÙng để lưu trữ các ảnh ở cột 2
     * @param model3 DÙng để lưu trữ các ảnh ở cột 3
     * @param model4 DÙng để lưu trữ các ảnh ở cột 4
     */
    public void sortImage(PhotoPostsDTO model, PhotoPostsDTO model1,
                          PhotoPostsDTO model2, PhotoPostsDTO model3, PhotoPostsDTO model4) {

        int count = model.getListResult().size();
        List<PhotoPostsDTO> listModel0 = new ArrayList<>();
        List<PhotoPostsDTO> listModel1 = new ArrayList<>();
        List<PhotoPostsDTO> listModel2 = new ArrayList<>();
        List<PhotoPostsDTO> listModel3 = new ArrayList<>();
        List<Float> listHeight=  Arrays.asList(0f,0f,0f,0f);
        int minIdx = 0;
        for (int i = 0;i<count;i++){
            if (i!=0)
                minIdx = IntStream.range(0,listHeight.size())
                        .reduce((k,j) -> listHeight.get(k) > listHeight.get(j) ? j : k)
                        .getAsInt();

            PhotoPostsDTO photoPostsDTO = model.getListResult().get(i);
            StringBuilder url = new StringBuilder("http://localhost:8080/images/");
            url.append(photoPostsDTO.getImage());
            switch (minIdx){
                case 0:
                    listModel0.add(photoPostsDTO);
                    break;
                case 1:
                    listModel1.add(photoPostsDTO);
                    break;
                case 2:
                    listModel2.add(photoPostsDTO);
                    break;
                case 3:
                    listModel3.add(photoPostsDTO);
                    break;
            }
            float height = getHeightImage(url.toString());
            listHeight.set(minIdx,listHeight.get(minIdx) + height);
        }
        model1.setListResult(listModel0);
        model2.setListResult(listModel1);
        model3.setListResult(listModel2);
        model4.setListResult(listModel3);
    }


    /**
     * Phương thức tính <b>chiều cao</b> của ảnh lấy từ url
     * <br/>
     * <i>Created date : 28/02/2021 </i>
     * @param urlLink
     * @return
     */
    public float getHeightImage(String urlLink){
        try {
            URL url = new URL(urlLink);
            BufferedImage image = ImageIO.read(url);
            int height = image.getHeight();
            float temp = image.getWidth() / (float)281;// tỷ lệ của ảnh
            return height/temp;
        } catch (IOException e) {
            e.printStackTrace();
            return 0;
        }
    }

}
