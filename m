Return-Path: <SRS0=7v8Z=3U=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2506C33C9E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Jan 2020 02:30:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 867582067C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Jan 2020 02:30:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rczZ1cSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 867582067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:From:Subject:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=NP75l9rkNwJeXXRFovmh5jqxJpQrvmme9T5C5FqO/8Y=; b=rcz
	Z1cSaSNVkNqe8bdv7KBGecvh0ELNrZYe/CnayYPbd+tZfaN/UPWR1b2KPQfBXgSUj8xMXRnSSrw5I
	SMs1Mzv6rOh+y0Y2286KWa51lmYQlMyCdhxliD1O5xa+30EzFkwpQil2i/oT/eXBeREpfrrcjB+kc
	sQ6K1vuV1AFCqjfC5gcPXlRNpgoBaF3KDGyXUU8VuqO+4bzdBf5WlZ1p/qLSUjm5MYg2VxnEiLWhL
	X5Da7DHD8ZuvvXVIuIVXX5HklM5sVIUI7WH3OU3yN325zOfFzLsZsHZyWbpFx1ecLaBYo9jGncQ7l
	VtKJ4rjRDwGenb+KYKAA3aTuvSUd34w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixM4N-00077S-PL; Fri, 31 Jan 2020 02:30:07 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixM4J-000634-SM
 for linux-snps-arc@lists.infradead.org; Fri, 31 Jan 2020 02:30:06 +0000
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00V2R8A6195137
 for <linux-snps-arc@lists.infradead.org>; Thu, 30 Jan 2020 21:29:58 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xrj75epvk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-snps-arc@lists.infradead.org>; Thu, 30 Jan 2020 21:29:57 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-snps-arc@lists.infradead.org> from <noreply@ellerman.id.au>;
 Fri, 31 Jan 2020 02:29:55 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 31 Jan 2020 02:29:53 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00V2TqOZ54001742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2020 02:29:52 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68BEEA4060;
 Fri, 31 Jan 2020 02:29:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C104FA4054;
 Fri, 31 Jan 2020 02:29:51 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 31 Jan 2020 02:29:51 +0000 (GMT)
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 81735A021A;
 Fri, 31 Jan 2020 13:29:47 +1100 (AEDT)
Received: from 03820ad8799d (ka2.ozlabs.ibm.com [10.61.145.21])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 55229E00ED;
 Fri, 31 Jan 2020 13:29:50 +1100 (AEDT)
MIME-Version: 1.0
Subject: kisskb: OK linus/axs103_smp_defconfig/arcv2 Fri Jan 31, 13:28
From: noreply@ellerman.id.au
To: Vineet.Gupta1@synopsys.com, Alexey.Brodkin@synopsys.com,
 linux-snps-arc@lists.infradead.org
Date: Fri, 31 Jan 2020 02:29:50 -0000
X-TM-AS-GCONF: 00
x-cbid: 20013102-4275-0000-0000-0000039CA45C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20013102-4276-0000-0000-000038B0C3BE
Message-Id: <20200131022950.1.47670@03820ad8799d>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-30_09:2020-01-30,
 2020-01-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=556 impostorscore=0 phishscore=0 clxscore=1034
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001310018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_183003_923569_D5F097A9 
X-CRM114-Status: GOOD (  11.27  )
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

OK linus/axs103_smp_defconfig/arcv2 Fri Jan 31, 13:28

http://kisskb.ellerman.id.au/kisskb/buildresult/14118243/

Commit:   Merge tag 'drm-next-2020-01-30' of git://anongit.freedesktop.org/drm/drm
          9f68e3655aae6d49d6ba05dd263f99f33c2567af
Compiler: arc-linux-gcc.br_real (Buildroot 2016.11-git-00613-ge98b4dd) 6.2.1 20160824 / GNU ld (GNU Binutils) 2.27.51.20160928

Possible errors
---------------

 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */

Possible warnings (89)
----------------------

<stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
init/main.c:381:35: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
init/main.c:385:35: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
init/main.c:389:35: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
init/main.c:825:37: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type '__kernel_size_t {aka unsigned int}' [-Wformat=]
kernel/dma/direct.c:32:4: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
fs/ext4/xattr.c:482:8: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
drivers/base/regmap/regmap.c:1533:22: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1305:35: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1320:35: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1327:35: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1333:35: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1587:17: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1587:17: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
 #define KERN_WARNING KERN_SOH "4" /* warning conditions */
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
 #define KERN_WARNING KERN_SOH "4" /* warning conditions */
mm/percpu.c:2160:27: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/percpu.c:2160:32: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/percpu.c:2160:37: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
mm/percpu.c:2160:42: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
mm/percpu.c:2160:52: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
mm/percpu.c:2160:56: warning: format '%zu' expects argument of type 'size_t', but argument 8 has type 'unsigned int' [-Wformat=]
mm/percpu.c:2291:35: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/percpu.c:2297:35: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/percpu.c:2303:35: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/percpu.c:2309:35: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
drivers/base/regmap/regcache.c:715:20: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/base/component.c:195:24: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/dmapool.c:93:46: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
mm/dmapool.c:93:51: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
include/linux/overflow.h:59:15: warning: comparison of distinct pointer types lacks a cast
include/linux/overflow.h:60:15: warning: comparison of distinct pointer types lacks a cast
include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
drivers/dma-buf/dma-buf.c:402:26: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka const unsigned int}' [-Wformat=]
fs/buffer.c:237:10: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
drivers/gpu/drm/drm_dp_helper.c:699:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_dp_helper.c:732:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_dp_helper.c:786:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_dp_dual_mode_helper.c:203:16: warning: format '%zd' expects argument of type 'signed size_t', but argument 5 has type 'ssize_t {aka int}' [-Wformat=]
drivers/gpu/drm/drm_dp_dual_mode_helper.c:222:16: warning: format '%zd' expects argument of type 'signed size_t', but argument 4 has type 'ssize_t {aka int}' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/drm/drm_print.h:120:24: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
net/sunrpc/xprtsock.c:2610:16: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_atomic_uapi.c:131:21: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_gem_cma_helper.c:108:21: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_gem_cma_helper.c:503:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
net/sunrpc/svc.c:1440:33: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
net/ipv4/tcp_input.c:4398:49: warning: array subscript is above array bounds [-Warray-bounds]
include/linux/kernel.h:835:29: warning: comparison of distinct pointer types lacks a cast
drivers/usb/host/ehci-q.c:376:2: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/usb/host/ehci-q.c:376:2: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
