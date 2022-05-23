Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03A7C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 23 May 2022 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FCIIA1nHhQW1mKiELzQN6k9A1y/A7zblA8MWLvOPs6M=; b=r0bzId3jaet0ie
	XjGg/FtQiGy+VxF4p1kfWEt+4PrRVbDBh78b4/B3zKj0uRBxLZoKsr7qb4xQk3XXartDvB2bHbLVf
	qQ8kZUBSVUgmt3LoLbbPRNcWmiBqz2ZBt2WbXpblSgYL3UU7hdwsgKcXiYY+Y2l/fiOe5NS6dvmU6
	Zu8OiAy5UqFfl/p+UDO4o/B3s6L1kUriHDGsVdUUhwstmUnPKby0i/g7X6pqzMzs2amViAwKdsxDf
	cxPDsxAawrCSJW09T7vHyHoVT/ykeC5rggxlZubf2EWFSO/Vs1a2wttYmXARNEmqY1zTzsgp0LJBW
	/gO4OFU2AfYIqfo3T8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt428-002hgA-Td; Mon, 23 May 2022 09:07:24 +0000
Received: from mail.tireplot.pl ([46.183.184.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3EJ-002M5B-9g
 for linux-snps-arc@lists.infradead.org; Mon, 23 May 2022 08:15:56 +0000
Received: by mail.tireplot.pl (Postfix, from userid 1001)
 id 209C14ACD4; Mon, 23 May 2022 10:06:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tireplot.pl; s=mail;
 t=1653293234; bh=Rfzvu4C+yJ1wyuJ4V+t/udh6cgYEQVnY6S5ltO4wdNg=;
 h=Date:From:To:Subject:From;
 b=dxneA+B8EkkVDWLdcXPgv1GLbKbRSSEm+3Y8qL8clPgQAsAPEtICeD5bCQ7OB/kA4
 9CfCLudRg3NuvaxI9e0I4vbemtrOZzrTADEekd4TGZ6LtYNZbRfEl13m/yF5jzRCAS
 QsOZruCr3M8S6kXzsunrjtwj1bRTG2EEZ3Isq3MT2KxzFOKn1FpV0Q0u4ZHG4487PN
 l1VgogoZQeGLalkTnSU/2GqCoGeFBrvUr3846CxP2wgSQKmVBWeHMlntzBnaY/noyO
 8qFvUFC9U9Si4FhW7A7YHHruxPYv73iZh756C8zLebnXvcMu5xZzOxwRv8BFJ51ljN
 nCfwbKd2z2rIg==
Received: by mail.tireplot.pl for <linux-snps-arc@lists.infradead.org>;
 Mon, 23 May 2022 08:05:32 GMT
Message-ID: <20220523084501-0.1.2k.fykr.0.3bqg2zgbk9@tireplot.pl>
Date: Mon, 23 May 2022 08:05:32 GMT
From: =?UTF-8?Q?"Arkadiusz_Soko=C5=82owski"?=
 <arkadiusz.sokolowski@tireplot.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Koszty instalacji fotowoltaicznej
X-Mailer: mail.tireplot.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_011555_647690_14C50FC6 
X-CRM114-Status: UNSURE (   0.07  )
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
dyB0eW0gdGVtYWNpZT8KClBvemRyYXdpYW0KQXJrYWRpdXN6IFNva2/Fgm93c2tpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBt
YWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
