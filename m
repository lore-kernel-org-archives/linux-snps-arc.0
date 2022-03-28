Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF526C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Mar 2022 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X+d/zhPZpj3icfnsRr7KTDXBLnUsnDIP5hq/Ncs+fcw=; b=Jmq0c77bOU5PqQ
	UKrzh4/HZxdxJAWHuDNb52CuMZ596jrBeQrvtSU2OlDUiu3ZVuF+uiZCmxYAfLj1X0VbGHxMSIqJz
	7v2ySgUd1XpXfzycPvD1HVp24UBHF/5mKkL2LcFcwnbhfOjKaQewam7vwrTPv6Vsv1Ubqcb2kZSaM
	bH5QvV3cN7N1Q83xDX1MRUQyWat8atcDLgoERYVvh/PCAflyNu+ziVjgHKTrqH71wkJzumQcBE+m3
	QblD3jSKDWqrxJiV7MP+I0INFC+qCETCOmtLo8lm7cPRwmQLnOPaG9QZC/x52lTv+cp4q3yNcm0WD
	1t5gSv0MCLlGH6qFcLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYk5o-007fYR-UI; Mon, 28 Mar 2022 07:47:12 +0000
Received: from mail.ourpartnership.pl ([80.211.82.238])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYk5m-007fXs-Fj
 for linux-snps-arc@lists.infradead.org; Mon, 28 Mar 2022 07:47:11 +0000
Received: by mail.ourpartnership.pl (Postfix, from userid 1001)
 id 1F48661B3F; Mon, 28 Mar 2022 08:46:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ourpartnership.pl;
 s=mail; t=1648453628;
 bh=M1ZVeu3q6Upppe+FUx/3rgI7MKJXh389NZDbgCK1SX4=;
 h=Date:From:To:Subject:From;
 b=lQJ/Fol4hmcwN1p+D8obijAi/qoGP3Yoe/warx2wHxoDBgnMB0AgFxiR/PaMiRN1k
 dju+YDcm0/+v225M4sSvLwqW4sxIWbbCiDnwmdzaHlqmu+GtpFQoEZ2SWAKfrli4ED
 b9XhvqCWVn9hJ9QqVuL/da5QhGwAvUjP26zhGFsVf0r0OuvnyeLJD01CgpIXu1J15w
 4o0LOxEE65vix5RSRQsfz50DrbSWyDePI0VRLbEqv5rhkW/RIPNw076aVWI/OV6fWE
 +MF2N2xScS5rB1o+XrixKBwTw2lPsxJb7WO9io4KFxiCFqt6ijYVwZ8Dy1efPUl3tq
 90JMc17aD9/Uw==
Received: by mail.ourpartnership.pl for <linux-snps-arc@lists.infradead.org>;
 Mon, 28 Mar 2022 07:46:04 GMT
Message-ID: <20220328074501-0.1.9.2ark.0.qlldlak7ob@ourpartnership.pl>
Date: Mon, 28 Mar 2022 07:46:04 GMT
From: =?UTF-8?Q?"Arkadiusz_Soko=C5=82owski"?=
 <arkadiusz.sokolowski@ourpartnership.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Koszty instalacji fotowoltaicznej
X-Mailer: mail.ourpartnership.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_004710_691513_979E6B80 
X-CRM114-Status: UNSURE (   0.91  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKc3R3b3J6eWxpxZtteSBzcGVjamFsbsSFIG9mZXJ0xJkgZGxhIGZpcm0s
IG5hIGtvbXBsZWtzb3fEhSBvYnPFgnVnxJkgaW53ZXN0eWNqaSB3IGZvdG93b2x0YWlrxJkuICAK
ClNwZWNqYWxpenVqZW15IHNpxJkgdyB6YWtyZXNpZSBkb2JvcnUsIG1vbnRhxbx1IGkgc2Vyd2lz
aWUgaW5zdGFsYWNqaSBmb3Rvd29sdGFpY3pueWNoLCBkeXNwb251amVteSBuYWpub3dvY3plxZtu
aWVqc3p5bWkgcm96d2nEhXphbmlhLCBrdMOzcmUgemFwZXduacSFIFBhxYRzdHd1IG9jemVraXdh
bmUgcmV6dWx0YXR5LgoKTW/FvGVteSBwcnp5Z290b3dhxIcgZGxhIFBhxYRzdHdhIHdzdMSZcG7E
hSBrYWxrdWxhY2rEmSBpIHByemVhbmFsaXpvd2HEhyBlZmVrdHkgbW/FvGxpd2UgZG8gb3NpxIVn
bmnEmWNpYS4KCkN6eSBzxIUgUGHFhHN0d28gb3R3YXJjaSBuYSB3c3TEmXBuxIUgcm96bW93xJkg
dyB0eW0gdGVtYWNpZT8KCgpQb3pkcmF3aWFtCkFya2FkaXVzeiBTb2tvxYJvd3NraQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMg
bWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
