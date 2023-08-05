# GM_S22
Project for RPI's Spring 2022 course, CSCI-4964 Graph Mining.

We experiment with the masked CANDECOMP/PARAFRAC (CP) decomposition for collaborative filtering in recommender systems with vector weight edges.

## General Problem and Motivation

Given a bipartite graph _G_ representing users _U_ and products _P_ as vertices and recommendations of products for users as edges _B_ between them, we want to interpret the reviews in the graph as a tensor _T_. 

Note that graph _G_ is not usually complete. That is, some products have not been reviewed by all users, or some users have not reviewed all products. By storing these reviews as a tensor, we can perform a tensor decomposition to get several simple tensors that approximate _T_ when their outer product is taken. Normally, missing data worsens the error of this approximation. This motivates our problem, and it led us to use a masked-CP decomposition as described in the attached paper. Using this approximation, we can estimate other reviews between users and products that do not exist in the given data. This gives us a tensor-based implementation of a recommender system given incomplete data.

## Dataset

We used data aggregated from the BeerAdvocate website. Although the original BeerAdvocate is no longer running, the Stanford SNAP Lab has saved this data and hosted it on data.world. See Section IV in the paper for a discussion of methods used to interpret this data into a bipartite graph.
