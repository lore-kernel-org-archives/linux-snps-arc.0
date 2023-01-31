Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AE2C636D3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Jan 2023 03:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kSBMs1+Mo+Q/2LZ+HIXEGb50gz2T0y9WudTYN5DCXSg=; b=lmvPCg/gRhMc1/2x2vk1UFDctO
	qjRl4S5EeMTDiOun9IsyZXMERSsqfgArl1gjKFWiPG53v5JB05nZpNMHRjT3PXyuyhWWxxJqy0D5v
	jynHcj0mWg+W/ciOsmJzdmXnA9hIjIjB7o+S4PhZChjkJHr/iG+UF9/YDECDpvf3E+jCDjENjPa7c
	Jg/HrTOcGgu6HKXpXrSgx3p36tdzh1nZh56gIKxK1nig8eF7LdqAM/1HuF3T0cWw6Qxe5ne+98Wqe
	sBE0VJzC/0F1UPORXmda/fZS/7F56FcDvt4omjj8ojV58REbKD+VRmQwvDf8juvc4qJi/rLDRn2a1
	xGF3NcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMgzZ-0068hw-Sk; Tue, 31 Jan 2023 03:07:29 +0000
Received: from out-157.mta0.migadu.com ([91.218.175.157])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMgzV-0068gp-TJ
	for linux-snps-arc@lists.infradead.org; Tue, 31 Jan 2023 03:07:27 +0000
Message-ID: <323b6822-6442-0aca-15dd-3e58ed2c6953@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1675134439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+3h4Dgm1JJu5RagcLAae9JknRVO0bTo5pa4EuDq+R2c=;
	b=ru8T+MEt9/BLoDaCfi4yOvXiEj4jKLR2Lq7aDnvZ3v2djmC43QsuUOtyp6Vaj8/zmRP55Y
	R01/xngPWqRXVWqy9KLzBNL5KePbiVeCRe+2dcC4L3ebLTt9yZYouR6wx7+fLw2xJv1WAS
	MjCFSfd4/yOVDKxv6v2Ax3TnyTBF3TU=
Date: Mon, 30 Jan 2023 19:07:10 -0800
MIME-Version: 1.0
X-Mozilla-News-Host: news://news.gmane.io:119
Content-Language: en-US
To: Carlos O'Donell <carlos@redhat.com>
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Pavel Kozlov <Pavel.Kozlov@synopsys.com>,
 GNU C Library <libc-alpha@sourceware.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Subject: Pavel steping up for ARC glibc maintenance
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_190726_405511_19BAFEEA 
X-CRM114-Status: UNSURE (   1.12  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Carlos,

I'd like to introduce Pavel who intends to step up to maintain ARC glibc 
port and do periodic wiki updates and such.
I've pointed him to links [1] and [2].

To begin with can he be granted wiki edit access and subsequently also 
approve his write access to glibc sourceware repo.

Thx,
-Vineet


[1] 
https://sourceware.org/glibc/wiki/MAINTAINERS#Becoming_a_maintainer_.28developer.29
[2] https://sourceware.org/glibc/wiki/MAINTAINERS#AccountsOnSourceware


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
