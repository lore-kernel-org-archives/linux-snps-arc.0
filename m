Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2802EC43334
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jul 2022 07:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zvcJj/pyeyMLoE/LFLplOMs0ffsJcIJkdSgT9wu99fo=; b=38p67sidqVkFNF
	2FmKZRSMC8sFH2L7PwFBaO4f2KOA9SEuX2tC0m9yBb3KZRPOY8ibBouIkGzBr+WQkzatwx3P7Hk8P
	yUNccdOJttr8Vm7TAxD9dPUmnT1Ou3DU/kDPaL7EULDH6F5iA8pmEH0KnQi0bhjiTQvrjPyi0bOri
	CUhhk+JKtx9LqPca5sXRHorYKUCypomMrDPqyWq+qobse0k3yIdYbYxJLmuvp4YxtT6eH56O5doNL
	7IOu3aTsgv1cwxVR2yUaywmkBOrMnoRkmkSr7WOSiqSoBLk58kJgorLBKV+/ddkaKhzH8w9JkDftw
	xoI69Ku55Jrqtu0gyQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9M2M-00Eefc-IO; Thu, 07 Jul 2022 07:34:58 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9M2J-00EeSt-QN
	for linux-snps-arc@lists.infradead.org; Thu, 07 Jul 2022 07:34:57 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2675cU5T015768;
	Thu, 7 Jul 2022 07:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=4f9dd09OaARUnugVdZlzifmBLj2Odx8W0MtZUhQrEfg=;
 b=r9kWQ4IQSgudsAOYV1xpqljC8xU/j3IF2FQ6nwO62qrbZGLGv6//GZlnswhTjftuAdYF
 GbrWNH7xPYaimM4gosr+6BAnCs9Mr1DkfmtfEVVFhiMsat/AhFGUh2+6FQRWVCW1GEw0
 3Lj6fsrXrQeL57Emt5paoXJ6C+DgPxfh0r4iFdDLdiCo7378tWyYfpOz0r5eueoDYISs
 +kwOcETCmYDzHNmef3s5TONx/Ls6vKsVn5+OtXwTl4ytw9knYphHAWzs6UVGvxgp7wCs
 JnMvGFgJyX55EOs7mrnTcxHgCS4FDeOQXgfTa01yxz1Yctwgkt/EqJE1auIcQ7gwKmxC vw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubym8hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Jul 2022 07:34:45 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2677V1mm033429;
	Thu, 7 Jul 2022 07:34:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3h4ud1fdhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Jul 2022 07:34:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UinkOVjzyGFJZQHdRJRH1HVznHQX45U13qjSW4xJVxqIsXKid7eEphz3O6CRKNwcCS3pv/hSSAlguds8M16IrVUTbxiJNboJMcN4fz4YdFsmhkVdWKH6UvHsMpJR3gp5tvYv7pW3FT2PzIhgHN5NHt2vC4J+8CNFPO7DMlQQhbipURBhKYLJ6a5TAefyf4zytDxuIJq85jge2685dVVDCKyDR1YT/O5Ey8UChdQoNCHSNY8YudIL1jVRkeyEssDOJPOLlQSxPBEewdI8QRVCtRaJC035jj+H35ts8LCX+KPZW5RMcrIuHgEPPRRGNN/8mKAtXl915cyieBkUZM54Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4f9dd09OaARUnugVdZlzifmBLj2Odx8W0MtZUhQrEfg=;
 b=G34WWT028bA/pXsnQaVavU1LCdWCFVLO+qDFikmtv/dhT2ZN176TKPhYu8+8V8Mpg1Cmg7MUZYO7kn9wh4ZiEuu8ga77LF7tBecADqokbsFN8YLq3vRUcEqOcjrsUUgETub/nyCmSZu2wI+NBgmoJCn1lmulIkwJHNgvr3kMe26o2eZTTF2OvqB4WBA0jQ4NAf6CMaGF1WIKKaxfgoccEDUlxDUvYflpmwPwTIXUu9gXa4rS+PBIukDonwwgvA/CxJnjIsZpRXRN3N+887rPn5B1BXCfweYCJ7k0LrdTvGqkWhb7ObCiBIJs6VdxNPRAp/9eQxqbARMQTLQTdlNAeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4f9dd09OaARUnugVdZlzifmBLj2Odx8W0MtZUhQrEfg=;
 b=oq2ztUWPOeU9APvj7XQmlh3SEI2gAFlSd5Ihi+xob+kUWq98y9IK1pitRVCMl0LrCQMISUbriASZZb0Kkd34xHpofyf6xCLo2n6er7+NIQfrk9p+4DY3g7ZYY7SD5UaEqolA479dyIVgZuC4NR4/rXa+gQiS+HcMhj82AnZlI20=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN6PR10MB1971.namprd10.prod.outlook.com
 (2603:10b6:404:fa::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 07:34:41 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 07:34:40 +0000
Date: Thu, 7 Jul 2022 10:34:18 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vineet Gupta <vgupta@kernel.org>, lkp@intel.com
Cc: linux-snps-arc@lists.infradead.org,
        Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
        Claudiu Zissulescu <claziss@synopsys.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 2a2aa3f05338270aecbe2492fda910d6c17e0102
Message-ID: <20220707073418.GE2316@kadam>
References: <62c4cc30.05O9fixuQpRmfYPQ%lkp@intel.com>
 <20220706064906.GB2338@kadam>
 <416b7d42-51ec-2995-8f22-4d4c9ffe4624@kernel.org>
Content-Disposition: inline
In-Reply-To: <416b7d42-51ec-2995-8f22-4d4c9ffe4624@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0058.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::6)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 028e544f-e5b2-45eb-3895-08da5feb2720
X-MS-TrafficTypeDiagnostic: BN6PR10MB1971:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HOutKdvE5jab0DLmWGRtNC/oLsko5z+Fl7kjC8HZ3CKlrRuGbBpm3Q1v5U1hvwJZ6rPSdQt9wX8Aatp1Os3wQT3JuQUyF0eKjKL24bPGE9/qh0a/xwMYRtC2C2n2BmlXWrTwXAavDs06b7zGBSefL8I0IKPk1YjlOyUs40WI37F2z+aQ9VDhiviijtIC8i7Us+/eilB76G+dhyUprwpX9r7zSzqVM5zGyuhzfeZxqXToOgG3fi+G1SKPr9Wi7D/oGPlkEh1j3gwVTwBXyNH4rHyw6AXTlVP+lBG72WEBQaeZlfNcenW5itwFbUbVyMJL7DWq/ZcVDmeFoAtvSGVdNdF75cLnwUp5X5dI8xJVMf2ZSBWJdz66EHaZnm9BYMjJGWPow2bwiwEoMNV2O891Dx+Zfne04lTkDbcoEO7/a3c+vmLS2nSPC3YB2HIIrm0f5cTAF6wkZ9+kdh5UNVY8Vg3Y2FXZeaKviTW+h/22fd8W1LNpMjG1GxbldWIsTCuq3pnnq/cJwvVPKLx2KIIEP/zppjGOL/zes9Yr9JVm9wPQkC5jK+qlW2yY0VTLbj2iz4k5/TZSa4k7jNIAfkBbAEEB2ieb9Tv8xpwcA48arSdPPw5egoL1aq5SvAoA3Qfg7CRqszpPZj/PRTsc3CGJOW2Jkse0X7qaXU1jpyxCXptS8OnaSq+QBw3gBqD1PWD1eLgZKINmeDvghnyRWBtxI8/MaWGZWQf75aqjb12BL3gMR9cl0tbA0uLLs4xflJUHZUtCM8TWh89FVfNUq3BhrdjtEmVZrr0jfnhQ8qdpu9C32nJA07BJiSHwjE12pFAB
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(396003)(376002)(346002)(39860400002)(366004)(38100700002)(8676002)(1076003)(66946007)(186003)(4326008)(66476007)(66556008)(2906002)(6506007)(33716001)(38350700002)(316002)(41300700001)(44832011)(9686003)(6512007)(33656002)(83380400001)(6666004)(478600001)(6486002)(54906003)(5660300002)(52116002)(53546011)(86362001)(8936002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?EepO+Rj6AY9f4hfQN3H5nvB5P0Y3vyiGLHnSTwiLiWpLCGcmpW/zobm1kxjD?=
 =?us-ascii?Q?vQHYnVQevcFLLVUHW5dfJLgXso4Z9AqdN/lJYrvN7TtrMYrVRQM4CS7Y01uU?=
 =?us-ascii?Q?slrtNs5VqsBWyVk1cbadNVNMYr58xtBDgBhA/dv4vvG3sHCSbxx0L+kpX9Z0?=
 =?us-ascii?Q?7X2Mj822AiJuuA80d/1S3uJ3DbpA742upeWHfZdXo+sbLOnp6kbvETpj0g0F?=
 =?us-ascii?Q?QIugO2vSmkv6WGgMyq3QK7Lph9MHxyoZkaWSQWzEXR/sj5BTd3ooHd/epo+C?=
 =?us-ascii?Q?MusF12mLsi5owIWS/x9yeNoVrPgVPUzg8r3UhTVG96/UrncognW4ZJh793au?=
 =?us-ascii?Q?AiRNYoY8pMOgnX6g6MuouZpNWV1fkOSHTCP3+hrEqHp1dxX/li5DwFsupBR8?=
 =?us-ascii?Q?KB65cpEaWT8O6+E05huqOXLJT3wOWDcYzShjaJtZac/80mooe/IMQLHyL54j?=
 =?us-ascii?Q?+PpsiFVAoiOf9iiWcywJekTPM/DfeqoGFNUxbCUJtzxkStlA5kP17Pe91Utu?=
 =?us-ascii?Q?Hqazgc0+dznIZthNf06Svh+SLX5sQIk2/42kR6Q9y9F2sUqjDaLAnALqeyEy?=
 =?us-ascii?Q?RnCo7FolvuLKyv+xIUDsv7l0e3v2Wa74IUSoAMFpqIbmQH0693ozqbf7WgTG?=
 =?us-ascii?Q?5aex2MbgVyZE29R81Z11pn8t7jZUygTFqxH9RqlctYtSNyELXSVU8R04q0zF?=
 =?us-ascii?Q?quzfJ+DBOR0Q7F0gwPy5oG8K1KeNaWwg+AnjaGd/5JJct68UeE/nIOj+i7P2?=
 =?us-ascii?Q?5YsGaaXU3UeaFcBrH9Ib17c/zn8qx+uUJleKGm8/gJnqEKI07DnDEkYh8z+8?=
 =?us-ascii?Q?NONmyTv3hhV0g9tRuecbEq5NhehXWgxCpQ3o/RTNFP+dEhsSUCQE4z0QXT7k?=
 =?us-ascii?Q?xbeWeUTbuAK38BGoupvb7GD8tQrFZ11Qf0S/gGCCsDujmDrwT+eLVl7MVyEN?=
 =?us-ascii?Q?MfDIIFhNy2lNGCMBnp5a5Mvrc6eULBuD4p5ri5G3eShy+wiXDHrECs4+HqFQ?=
 =?us-ascii?Q?TekYUrEMjyHa0fWFnhJfA3Dol9uQwKwpuBP6SY1ASxm0TIICbAeYomiXWA6C?=
 =?us-ascii?Q?1608PLj1SSV1HNSl1x3Q6uWQoOJJfRBSi6AA9VWomNN1kAqoExHqgyAPMp1N?=
 =?us-ascii?Q?PC2yMdHlVzG3UtGudaMs2xJDlR8UrQNevEnvvVGZVZIpDqvqmzkNkGLwJxMY?=
 =?us-ascii?Q?fbo4rmU8JK1YrN9cY7AZKWPv6DJTJwhg7QIlkdO3r2tljogj5tDmRVWoOo1O?=
 =?us-ascii?Q?pVZ/F4UhrNIiw0XHvFhXir1d6GehWC5Tg9RwdNyNFs2tVVgxK5yT2XDATvmq?=
 =?us-ascii?Q?qWwT4gsj1abbRUtAmSQQ1+f3TmOyeobcdze/FM6ybevRuwSG0/I8qCKdUJus?=
 =?us-ascii?Q?xl8fhb5uS3ZS9p+WYr6TAuf+50c+8zng+ibaslQfKb3xVosfEH9pbR463XcW?=
 =?us-ascii?Q?7sF93lVUdCq0uVPHffIWMwtonFSxlO4zzvF5rsBaLTC6x2m2ej9XiZu2+DWr?=
 =?us-ascii?Q?03rWLvjc3fIk/bQQQmyw37Lww9hq+sGUw7CVE5pQdQfjdtl+bMFcKR2HujFm?=
 =?us-ascii?Q?1JU2kVR+L6g3gtaMQ/1XZUqN6wkDG5idl4tmObzWejsqfo7qmjPMPNl5r70v?=
 =?us-ascii?Q?KQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 028e544f-e5b2-45eb-3895-08da5feb2720
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 07:34:40.6441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tw47tcHf6naeGzvZbB/iGIvor9OVz/9djdW92sqBinjbsQfLbQQdAmrDw1Z0YaRtG5C9PBpw0JLRT6i8/sYeldiL16eiAOxLNSwRfTU0Hek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1971
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-07_05:2022-06-28,2022-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207070028
X-Proofpoint-GUID: LqZI0dxyUZikYXO_sX1sYwYUpNs0Ozat
X-Proofpoint-ORIG-GUID: LqZI0dxyUZikYXO_sX1sYwYUpNs0Ozat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_003455_908276_72B7EB20 
X-CRM114-Status: GOOD (  19.87  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

If I had to guess, I'd say it was probably the recent changes in
linux-next with bitops.  Those things messed up Smatch as well and the
timing fits.  But I don't have a way to test.

Anyway, let's ask the kbuild devs.

On Wed, Jul 06, 2022 at 11:09:13AM -0700, Vineet Gupta wrote:
> 
> 
> On 7/5/22 23:49, Dan Carpenter wrote:
> > [ trimmed massive CC list (see below) ]
> > 
> > What's going on with all the arch/arc build breakage on linux-next?
> > 
> > regards,
> > dan carpenter
> 
> linux-snps-arc is not there, does one need to subscribe to these ?

I don't know how the CC list for BUILD REGRESSIONs is made.

> > > Unverified Error/Warning (likely false positive, please contact us if interested):
> > > 
> > > block/partitions/efi.c:223:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > > block/sed-opal.c:427:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > > crypto/asymmetric_keys/pkcs7_verify.c:311:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > > drivers/ata/libata-core.c:2802:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > > drivers/ata/libata-eh.c:2842:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > > drivers/ata/sata_dwc_460ex.c:691:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > > drivers/base/power/runtime.c:1570:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > > drivers/block/rbd.c:6142:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> 
> [snip..]
> 
> We would need more specifics: what compiler version is this ?
> Thx for bringing this to our attention.

Hey LTP devs, which GCC are you using and which .config is generating
these "internal compiler error" issues?

regards,
dan carpenter


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
