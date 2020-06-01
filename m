Return-Path: <SRS0=EH8H=7O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FA6C433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 14:18:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 032FC20772
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 14:18:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ll5H7P+7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 032FC20772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deneb.enyo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jh/AFiALvOlC2aQK2IpIP59E81D/NEIK31T11vIm/kw=; b=Ll5H7P+7PXHFM8
	d/IPLPl7hx8spM0yOlvn2q/kLSRKxdzWt9U5NG+g4i2Ldpw56afj/0uwiBaYY4K5U5KX4gmh4z/QG
	sSAXN0tusp3d00fmggQNE4ttfkiULt0wCC7QaIQT9rZfm9vnTL8fW9WG+Y2YDUhQ0YCaOuvU2QM78
	5Y9GvRKqvpbHDUUBWtZvTsj1COe1GSAkSPKj/MzYWYCOuWr3emg+P/tUR7Hf8cKxSEqwUrg10H/MA
	t/8E1zHtVqKe1lijg+CJkS50W1R3He3w6RzS3gWrQGFDBu/OjLYx7JgzqoSXxtruql7L1l/OZhKU+
	p9RhFn7S+aFENkcpNXTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jflGv-00061j-MR; Mon, 01 Jun 2020 14:18:37 +0000
Received: from albireo.enyo.de ([37.24.231.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jflGs-00061D-Hp
 for linux-snps-arc@lists.infradead.org; Mon, 01 Jun 2020 14:18:35 +0000
Received: from [172.17.203.2] (helo=deneb.enyo.de)
 by albireo.enyo.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1jflGj-0004Y1-Ji; Mon, 01 Jun 2020 14:18:25 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
 (envelope-from <fw@deneb.enyo.de>)
 id 1jflGj-0007Ew-Ga; Mon, 01 Jun 2020 16:18:25 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
Subject: Re: [PATCH 2/5] iee754: prvoide gcc builtins based generic sqrt
 functions
References: <20200530020047.5490-1-vgupta@synopsys.com>
 <20200530020047.5490-3-vgupta@synopsys.com>
Date: Mon, 01 Jun 2020 16:18:25 +0200
In-Reply-To: <20200530020047.5490-3-vgupta@synopsys.com> (Vineet Gupta via
 Libc-alpha's message of "Fri, 29 May 2020 19:00:44 -0700")
Message-ID: <87pnaiyimm.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_071834_587491_BE771F2F 
X-CRM114-Status: UNSURE (   2.18  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

VGhlcmUncyBhIHR5cG8gaW4gY29tbWl0IHN1YmplY3Q6IOKAnHBydm9pZGXigJ0uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBt
YWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
