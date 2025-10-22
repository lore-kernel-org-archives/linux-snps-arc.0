Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390B8CCD1AB
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Oct 2025 08:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o/5KNbdZ6XsbNER/+lfiU228ih9TB6Gt0uzDFmuYLl0=; b=OLDin5ykrSRQcd
	1Ipx9LXX6PjqL7gGYzSgbbuFT1/16YGBWp/mQA9Iv5kNrLbb9guEVh7faRkqzNnZaXH5i1y5yf9E1
	bH5dftq/E3JLG5VkSrsOrB3oy2cS7ZwmMvNlhPffNbma1BHT3Ye8ZwJ9C0M+VjCik34eMQEBkvt5m
	LOcayJGnk0s0+/5SohYp+ju0ZRWhUpv88YMZellpvkAjuGz32JLLVCzy+vQy4ucbPzKC8duqe1tHA
	4iTH53Nk7ovMOCuSnOwWSwWrLoQTpbtUQKUVnavTl8JAaq4m5rs1IUvSULl2x7HwpASHkudhe8Fbf
	8F8wlGYrZ+tVVmLvbtMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTws-0000000220C-3W7s;
	Wed, 22 Oct 2025 08:11:59 +0000
Received: from mail.taskera.pl ([51.75.73.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTwq-000000021yk-1Ke7
	for linux-snps-arc@lists.infradead.org;
	Wed, 22 Oct 2025 08:11:57 +0000
Received: by mail.taskera.pl (Postfix, from userid 1002)
	id A1A1525C1C; Wed, 22 Oct 2025 10:11:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=taskera.pl; s=mail;
	t=1761120713; bh=LHmroAf0IX0JOjVUiIwqM4s8ghVxxktECxT6AQD+q2c=;
	h=Date:From:To:Subject:From;
	b=QwYy8SYp2uUuJzC7Zvu3zRXCgmUdab9Sj2S+bKbMth7wKnTectbtXDJWc0dak9n+g
	 Z9dzjimDcKYON0UraINs+sjWcAgGirZGCwvBS5xe4Nu5ErH37meXRVJnYzw/46uMu7
	 LbholrnuJ0A+45LwDQHM/qMUJiS2prR3QEh25kUv6TQdlAeuIdjv1e5uv2WrPO2l1b
	 fjHQ9IxRUWmIo/fXUigYlN4mBZcSGEuS6HZP652OVvln5mWm93Omr5ZeUxrUMzn7Ze
	 RP3YYIDLksn9JN/qFHGpMStCG03EY8mnhmNfRhzfg9gHzSqamVlU22EptGzyFD1O17
	 mytzdIRWlDZfA==
Received: by mail.taskera.pl for <linux-snps-arc@lists.infradead.org>; Wed, 22 Oct 2025 08:11:10 GMT
Message-ID: <20251022084500-0.1.e0.vvn3.0.s6zv5dqflb@taskera.pl>
Date: Wed, 22 Oct 2025 08:11:10 GMT
From: "Eryk Wawrzyn" <eryk.wawrzyn@taskera.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Zwrot
X-Mailer: mail.taskera.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_011156_563092_A1FC7344 
X-CRM114-Status: UNSURE (   0.47  )
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

RHppZcWEIGRvYnJ5LAoKa29udGFrdHVqxJkgc2nEmSB3IGltaWVuaXUga2FuY2VsYXJpaSBzcGVj
amFsaXp1asSFY2VqIHNpxJkgdyB6YXJ6xIVkemFuaXUgd2llcnp5dGVsbm/Fm2NpYW1pLgoKT2Qg
bGF0IHdzcGllcmFteSBmaXJteSB3IG9kenlza2l3YW5pdSBuYWxlxbxub8WbY2kuIFByb3dhZHpp
bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBuYSBldGFwYWNoOiBwcnplZHPEhWRvd3ltLCBzxIVk
b3d5bSBpIGVnemVrdWN5am55bSwgZG9zdG9zb3d1asSFYyBkemlhxYJhbmlhIGRvIGJyYW7FvHkg
S2xpZW50YS4KCktpZWR5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPwoKClBvemRyYXdpYW0KRXJ5ayBX
YXdyenluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNu
cHMtYXJjCg==
