% CNTRACS subject-wise Mutual information from Whiole brain louvain module partitions 
% Reviewer request for MI between tasks
% control conditions in the RiSE and DPX tasks

%add path to new BCT toolbox
bctFolder = '/Users/PSYC-klr3342/Documents/MATLAB/BCT/';
addpath(genpath(bctFolder));

%select the task conditions
E_Item_ModFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_E/SubjectWiseModularity_RISE_E_Item_gamma1.mat';
E_Rel_ModFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_E/SubjectWiseModularity_RISE_E_Relation_gamma1.mat';
IR_Item_ModFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_IR/SubjectWiseModularity_RISE_IR_Item_gamma1.mat';
IR_Rel_ModFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_IR/SubjectWiseModularity_RISE_IR_Relation_gamma1.mat';
ACue_ModFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/DPX_245/SubjectWiseModularity_DPX_ACue_gamma1.mat';
BCue_ModFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/DPX_245/SubjectWiseModularity_DPX_BCue_gamma1.mat';

%load the adj mats
E_ItemData = load(E_Item_ModFile)
E_RelData = load(E_Rel_ModFile)
IR_ItemData = load(IR_Item_ModFile)
IR_RelData = load(IR_Rel_ModFile)
ACueData = load(ACue_ModFile)
BCueData = load(BCue_ModFile)

%Partition Vectors
%DPX has fewer participant than RISE, 
%If we remove subject 3, 28, 39, 43 from RISE then there are consistent
%subjects across tasks
E_ItemPartitionVectors = E_ItemData.maxQmodvector([1:2 4:27 29:38 40:42 44:56],:);
E_RelPartitionVectors = E_RelData.maxQmodvector([1:2 4:27 29:38 40:42 44:56],:);
IR_ItemPartitionVectors = IR_ItemData.maxQmodvector([1:2 4:27 29:38 40:42 44:56],:);
IR_RelPartitionVectors = IR_RelData.maxQmodvector([1:2 4:27 29:38 40:42 44:56],:);
ACuePartitionVectors = ACueData.maxQmodvector;
BCuePartitionVectors = BCueData.maxQmodvector;

%WHOLE BRAIN
for subject = 1:52
    % Comparing Low CC conditions
    [ACue_EItem_Variation(subject),ACue_EItem_MutualInformation(subject)] = partition_distance(ACuePartitionVectors(subject,:)',E_ItemPartitionVectors(subject,:)');
    [ACue_IRItem_Variation(subject),ACue_IRItem_MutualInformation(subject)] = partition_distance(ACuePartitionVectors(subject,:)',IR_ItemPartitionVectors(subject,:)');
    [EItem_IRItem_Variation(subject),EItem_IRItem_MutualInformation(subject)] = partition_distance(E_ItemPartitionVectors(subject,:)',IR_ItemPartitionVectors(subject,:)');
    
    % Comparing High CC conditions
    [BCue_ERel_Variation(subject),BCue_ERel_MutualInformation(subject)] = partition_distance(BCuePartitionVectors(subject,:)',E_RelPartitionVectors(subject,:)');
    [BCue_IRRel_Variation(subject),BCue_IRRel_MutualInformation(subject)] = partition_distance(BCuePartitionVectors(subject,:)',IR_RelPartitionVectors(subject,:)');
    [ERel_IRRel_Variation(subject),ERel_IRRel_MutualInformation(subject)] = partition_distance(E_RelPartitionVectors(subject,:)',IR_RelPartitionVectors(subject,:)');
    
    % Comparing whats left
    [BCue_EItem_Variation(subject),BCue_EItem_MutualInformation(subject)] = partition_distance(BCuePartitionVectors(subject,:)',E_ItemPartitionVectors(subject,:)');
    [BCue_IRItem_Variation(subject),BCue_IRItem_MutualInformation(subject)] = partition_distance(BCuePartitionVectors(subject,:)',IR_ItemPartitionVectors(subject,:)');
    [ACue_EIRel_Variation(subject),ACue_EIRel_MutualInformation(subject)] = partition_distance(ACuePartitionVectors(subject,:)',E_RelPartitionVectors(subject,:)');
    [ACue_IRRel_Variation(subject),ACue_IRIRel_MutualInformation(subject)] = partition_distance(ACuePartitionVectors(subject,:)',IR_RelPartitionVectors(subject,:)');
    [EItem_IRRel_Variation(subject),EItem_IRRel_MutualInformation(subject)] = partition_distance(E_ItemPartitionVectors(subject,:)',IR_RelPartitionVectors(subject,:)');
    [ERel_IRItem_Variation(subject),ERel_IRItem_MutualInformation(subject)] = partition_distance(E_RelPartitionVectors(subject,:)',IR_ItemPartitionVectors(subject,:)');
end
% Task vs Power
for subject = 1:52
    [ACue_Power_Variation(subject),ACue_Power_MutualInformation(subject)] = partition_distance(ACuePartitionVectors(subject,:)',Power);
    [BCue_Power_Variation(subject),BCue_Power_MutualInformation(subject)] = partition_distance(BCuePartitionVectors(subject,:)',Power);
    [EItem_Power_Variation(subject),EItem_Power_MutualInformation(subject)] = partition_distance(E_ItemPartitionVectors(subject,:)',Power);
    [ERel_Power_Variation(subject),ERel_Power_MutualInformation(subject)] = partition_distance(E_RelPartitionVectors(subject,:)',Power);
    [IRItem_Power_Variation(subject),IRItem_Power_MutualInformation(subject)] = partition_distance(IR_ItemPartitionVectors(subject,:)',Power);
    [IRRel_Power_Variation(subject),IRRel_Power_MutualInformation(subject)] = partition_distance(IR_RelPartitionVectors(subject,:)',Power);
end

%FPN - nodes [158:165 169:185]
for subject = 1:52
    % Comparing Low CC conditions
    [ACue_EItem_Variation(subject),ACue_EItem_MutualInformation(subject)] = partition_distance(ACuePartitionVectors(subject,:)',E_ItemPartitionVectors(subject,:)');
    [ACue_IRItem_Variation(subject),ACue_IRItem_MutualInformation(subject)] = partition_distance(ACuePartitionVectors(subject,:)',IR_ItemPartitionVectors(subject,:)');
    [EItem_IRItem_Variation(subject),EItem_IRItem_MutualInformation(subject)] = partition_distance(E_ItemPartitionVectors(subject,:)',IR_ItemPartitionVectors(subject,:)');
    
    % Comparing High CC conditions
    [BCue_ERel_Variation(subject),BCue_ERel_MutualInformation(subject)] = partition_distance(BCuePartitionVectors(subject,:)',E_RelPartitionVectors(subject,:)');
    [BCue_IRRel_Variation(subject),BCue_IRRel_MutualInformation(subject)] = partition_distance(BCuePartitionVectors(subject,:)',IR_RelPartitionVectors(subject,:)');
    [ERel_IRRel_Variation(subject),ERel_IRRel_MutualInformation(subject)] = partition_distance(E_RelPartitionVectors(subject,:)',IR_RelPartitionVectors(subject,:)');
    
    % Comparing whats left
    [BCue_EItem_Variation(subject),BCue_EItem_MutualInformation(subject)] = partition_distance(BCuePartitionVectors(subject,:)',E_ItemPartitionVectors(subject,:)');
    [BCue_IRItem_Variation(subject),BCue_IRItem_MutualInformation(subject)] = partition_distance(BCuePartitionVectors(subject,:)',IR_ItemPartitionVectors(subject,:)');
    [ACue_EIRel_Variation(subject),ACue_EIRel_MutualInformation(subject)] = partition_distance(ACuePartitionVectors(subject,:)',E_RelPartitionVectors(subject,:)');
    [ACue_IRRel_Variation(subject),ACue_IRIRel_MutualInformation(subject)] = partition_distance(ACuePartitionVectors(subject,:)',IR_RelPartitionVectors(subject,:)');
    [EItem_IRRel_Variation(subject),EItem_IRRel_MutualInformation(subject)] = partition_distance(E_ItemPartitionVectors(subject,:)',IR_RelPartitionVectors(subject,:)');
    [ERel_IRItem_Variation(subject),ERel_IRItem_MutualInformation(subject)] = partition_distance(E_RelPartitionVectors(subject,:)',IR_ItemPartitionVectors(subject,:)');

% Task vs Power
    [ACue_Power_Variation(subject),ACue_Power_MutualInformation(subject)] = partition_distance(ACuePartitionVectors(subject,:)',Power);
    [BCue_Power_Variation(subject),BCue_Power_MutualInformation(subject)] = partition_distance(BCuePartitionVectors(subject,:)',Power);
    [EItem_Power_Variation(subject),EItem_Power_MutualInformation(subject)] = partition_distance(E_ItemPartitionVectors(subject,:)',Power);
    [ERel_Power_Variation(subject),ERel_Power_MutualInformation(subject)] = partition_distance(E_RelPartitionVectors(subject,:)',Power);
    [IRItem_Power_Variation(subject),IRItem_Power_MutualInformation(subject)] = partition_distance(IR_ItemPartitionVectors(subject,:)',Power);
    [IRRel_Power_Variation(subject),IRRel_Power_MutualInformation(subject)] = partition_distance(IR_RelPartitionVectors(subject,:)',Power);
end

%save('SubjectWise_MutualInformation_ACue_vs_BCue_SZ.mat', 'ACuePartitionVectors','BCuePartitionVectors','DPX_MutualInformation','DPX_Variation');