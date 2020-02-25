Return-Path: <SRS0=AhAi=4N=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D479C35DEA
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 00:10:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C80F20732
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 00:10:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fYKnaWsT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C80F20732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hc3d+ZFCU6n8m0IFDTYrHrV2DnU2wgDYYhY9oxaQ7r4=; b=fYKnaWsT3y+dxp
	HtTkDDJkPV3kHG7rnkp9Lt8MlJ4rojrXzRHEECUqlKywyTvM6hb8GPnJpNtkcAtdbRasRSkBEGDU9
	7/Y1MReTcAnzpegs77ER4CyQx4WEcKLJa1wem2byWlr2XlWtXE62sguTVxID9P0JfSJlTzsc0s79G
	8iLDzmm0BylNpycRL4+f7XZMstqEHwIc4JUEq1iaAmOTTH2Pa+1RyJFhxYIbvbte4gmYW5/VEYQwl
	QgOyTdHrAiV2ZMBB4QKH8UIDSxNK1QKN7rgLY8Ldw98cNAarQ/2BCpFy8xnMxdVia5ABfiDCYA0a5
	RmojA/doOe/Zrx+j5SEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Nne-000840-1U; Tue, 25 Feb 2020 00:10:10 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Nna-000763-HU
 for linux-snps-arc@lists.infradead.org; Tue, 25 Feb 2020 00:10:08 +0000
IronPort-SDR: o+PFHQtS13S4TsAB6K4G89wClkb+9s57SxkhHtqpifomIz60szYRB1FoEH/1ql74W6yVswro/Q
 sb9qMjQwVmv/JuwL6cKpippeb4MeCJWfuZJbKe41ghQzjmexv74sbSl59ruMVAsAqmXemhoa/s
 DGrHYJkvcumFzuAKNZGhQ3tQqw7HR+UbpEY7hgsFRd6wmbyzJLeAJ5QfjEM69AEpHrE3sdHyFc
 12ZM164fJhu7SABdRR4rNGDHV3CjcfDZq/m7vANcyn9ogeP126az/zovpAOKZtgtseofP1hgmo
 Xj4=
X-IronPort-AV: E=Sophos;i="5.70,481,1574150400"; d="scan'208";a="48058577"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 24 Feb 2020 16:09:58 -0800
IronPort-SDR: EN08O+pCdCTZe/xsDFPpBJBABBN3Cun7S4ajaKr0gIaQidBz1eVtsx4pU2IWQekDJt+iD3us2w
 ldz0bbhcUA41dlB/HOPuPI/3e7xr4bZ+tQgrq5N0jfoDE7l1tf/o3BqXdDpDEgon758jWXbec6
 JOvkp4a6Qmq6RxN0XG3QH+Bgf6D21kyY5MRDS/MpOI/cnQQfZFWmeViVsRNSbbib34i3dBMYk1
 vR5Dy7o3tZl5eCqFgXwJPDaA9HYTKdjeW0ia0ixiITn1b5lqGI0czgbXa18A3DQ3NCbT3rygWI
 Gxs=
Date: Tue, 25 Feb 2020 00:09:53 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v2] asm-generic ABI: Allow statx syscall despite
 fstatat64,fstat64
In-Reply-To: <20200224221530.12928-1-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2002250008160.23654@digraph.polyomino.org.uk>
References: <87pne3lqrh.fsf@oldenburg2.str.redhat.com>
 <20200224221530.12928-1-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_161006_591622_54B98513 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
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
Cc: alistair.francis@wdc.com, linux-snps-arc@lists.infradead.org,
 libc-alpha@sourceware.org, alistair23@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, 24 Feb 2020, Vineet Gupta wrote:

> diff --git a/sysdeps/unix/sysv/linux/fxstat64.c b/sysdeps/unix/sysv/linux/fxstat64.c
> index 9133a0a29b8e..93394c450f1c 100644
> --- a/sysdeps/unix/sysv/linux/fxstat64.c
> +++ b/sysdeps/unix/sysv/linux/fxstat64.c
> @@ -33,15 +33,15 @@ int
>  ___fxstat64 (int vers, int fd, struct stat64 *buf)
>  {
>    int result;
> -#ifdef __NR_fstat64
> -  result = INLINE_SYSCALL (fstat64, 2, fd, buf);
> -#else
> +# if STAT64_IS_NOT_KERNEL_STAT64 || !defined(__NR_fstat64)

I don't think the extra space after "#" is correct here.  We use such 
spaces to indicate the level of nesting inside outer #if conditionals, but 
there is no outer #if conditional around this one in this file, so "#if" 
without the space is correct.

There should be a space before '(' in the "defined" call.

Likewise in other files changed by this patch.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
