Return-Path: <SRS0=vrW9=4Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4F7C10F00
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 15:22:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13F8420656
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 15:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NYhj7reE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13F8420656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deneb.enyo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTYSxLypXwa232mNRL2I0Ps+9/ss0hl+HIkswKs+0MQ=; b=NYhj7reEVeB0Us
	UIi3aqHx85MrqlqZsIs/U9vTxLbb6oCUUjGrXe2lowowLoTGx87HzbucuGhm7uosOvvRm6N3J0o6b
	5DoNMBrbNnAF+aCGuXHSHd5h7DD8DZKpzQKszzJIUIoLKiHXs4D/VJ6APH7+e5mDHcLzjYvrd/xyb
	XDpc8EP0bgjXqzgjcidTAx5DwZBbTI8GSAxa15fZTdk75puZ/dxCx8ygQW6aX4fLZLkzbwrbRk9AB
	QHYzwv88un8zr0W7X5+noKS/9osgZeMm4iFiOrAP+VassPuq4g+i/6XPwNLOdD45x93dnAQ370xb4
	Ezt3zs4fVP3zxtEw528w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAbHH-00013A-SO; Sat, 07 Mar 2020 15:22:11 +0000
Received: from albireo.enyo.de ([37.24.231.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAbHF-00012l-B8
 for linux-snps-arc@lists.infradead.org; Sat, 07 Mar 2020 15:22:10 +0000
Received: from [172.17.203.2] (helo=deneb.enyo.de)
 by albireo.enyo.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1jAbHA-0001BJ-Ok; Sat, 07 Mar 2020 15:22:04 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
 (envelope-from <fw@deneb.enyo.de>)
 id 1jAbFZ-0007jH-VC; Sat, 07 Mar 2020 16:20:25 +0100
From: Florian Weimer <fw@deneb.enyo.de>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v3 12/17] ARC: ABI lists
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <20200306182419.13945-13-vgupta@synopsys.com>
Date: Sat, 07 Mar 2020 16:20:25 +0100
In-Reply-To: <20200306182419.13945-13-vgupta@synopsys.com> (Vineet Gupta's
 message of "Fri, 6 Mar 2020 10:24:14 -0800")
Message-ID: <87y2sci43q.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200307_072209_541557_1D4096A8 
X-CRM114-Status: UNSURE (   4.15  )
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
Cc: linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

* Vineet Gupta:

> +GLIBC_2.32 sysctl F

This looks like a mistake, given that ARC doesn't even have the sysctl
system call.

I think the current way of suppressing that involves creating an empty
sysctl.mk file, as in sysdeps/unix/sysv/linux/x86_64/x32/sysctl.mk.
(Unfortunately, the ports added after x32 forgot to do that because
the in-tree default is wrong.)

Alternatively, we can remove the <sys/sysctl.h> header first and turn
sysctl into a compat symbol, so that the symbol will be gone without
further action on your part.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
