Return-Path: <SRS0=JgkD=3M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261B6C33CAA
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Jan 2020 08:28:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED1B724125
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Jan 2020 08:28:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gpvqjJcF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED1B724125
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:From:Subject:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5q46It5Nxf9SSHGBie0Z7IYyiofQXpHy+ZbL50Rq9Js=; b=gpv
	qjJcFIdSHqhSGUkU5+Nr/aPtDB5aasV5Vys5qlqtiXD43UtopGp1T6TWZwK/12ZFFzZDAKw9NxmWK
	kag9DlpkvXcnCEoRlIxcIhhNDeHyc/MxnR+NktRwWirTzQ1DmehyZCYdxQ5A8ZMfFxUXEEcGn1xRC
	WtSWw0GfEWPelFhhqtdyhX/goFr15oNp4/now89GnK08fc0sPPtLyhObb+W5tbyYZK4YZwAqzDbWQ
	eXrgeJKdSZmfs6bLh5WO4yaC3u0ivJJf3ttZ949mJLPxVY6OHA3oAkwSzAZ+qNdtHzWr4sSsIUbCU
	HqqajtVM0bk8Ipd/jFLdmXg4E8sWkZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuXr6-0003X8-4Y; Thu, 23 Jan 2020 08:28:48 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuXr2-0003WL-ML
 for linux-snps-arc@lists.infradead.org; Thu, 23 Jan 2020 08:28:46 +0000
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00N8RUb4049408
 for <linux-snps-arc@lists.infradead.org>; Thu, 23 Jan 2020 03:28:44 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xp963m2n1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-snps-arc@lists.infradead.org>; Thu, 23 Jan 2020 03:28:44 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-snps-arc@lists.infradead.org> from <noreply@ellerman.id.au>;
 Thu, 23 Jan 2020 08:28:42 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 23 Jan 2020 08:28:40 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00N8Sdr652953168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jan 2020 08:28:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FA4211C04A;
 Thu, 23 Jan 2020 08:28:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04D8C11C050;
 Thu, 23 Jan 2020 08:28:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jan 2020 08:28:38 +0000 (GMT)
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 2FD1AA01D6;
 Thu, 23 Jan 2020 19:28:35 +1100 (AEDT)
Received: from 03820ad8799d (ka2.ozlabs.ibm.com [10.61.145.21])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id D3309E00EB;
 Thu, 23 Jan 2020 19:28:37 +1100 (AEDT)
MIME-Version: 1.0
Subject: kisskb: OK linux-next/axs101_defconfig/arcompact Thu Jan 23, 19:27
From: noreply@ellerman.id.au
To: Vineet.Gupta1@synopsys.com, Alexey.Brodkin@synopsys.com,
 linux-snps-arc@lists.infradead.org
Date: Thu, 23 Jan 2020 08:28:37 -0000
X-TM-AS-GCONF: 00
x-cbid: 20012308-0012-0000-0000-0000037FEAF6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012308-0013-0000-0000-000021BC30F3
Message-Id: <20200123082837.1.75736@03820ad8799d>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-22_08:2020-01-22,
 2020-01-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxlogscore=542
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 suspectscore=2 clxscore=1034 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001230073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_002844_748151_7396EB00 
X-CRM114-Status: GOOD (  11.26  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
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

OK linux-next/axs101_defconfig/arcompact Thu Jan 23, 19:27

http://kisskb.ellerman.id.au/kisskb/buildresult/14104794/

Commit:   Add linux-next specific files for 20200123
          41539ebf9bacf9a9102322ad944990f5a38f5538
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4 / GNU ld (GNU Binutils) 2.23.2

No errors found in log

Possible warnings (3)
----------------------

net/ipv4/tcp_input.c:4390:49: warning: array subscript is above array bounds [-Warray-bounds]
drivers/gpu/drm/drm_dp_mst_topology.c:5399:9: warning: missing braces around initializer [-Wmissing-braces]
drivers/gpu/drm/drm_dp_mst_topology.c:5399:9: warning: (near initialization for 'desc.ident') [-Wmissing-braces]


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
