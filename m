Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE557C3064D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Jun 2024 08:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YOE8WhJogGtosYg3kAD0fsluRq9MXuSLa4uuarOhIOo=; b=oulOrAlE9TgxVq
	zCQ4+U0M69KBMbZDh+dRqawvkFtTGXtAPhE/oYVcmjfWJvGcizBCaNoojvDGsJ2A4MZqu7gUf1hti
	esAzsjtP3bC5rKTKGJrRqZAAx17Z2ea5f1/kHptAl8nQCO2QOjPMBdTBzkbCtrpYGFT6/q2HE0UFs
	YfxNWp2bK3nKHuB8hWAU/YbXLvuyRI1hCvOoI3aSP2QrdP/8BhQk9yVINmul9b4RiURE4wCQmEnmL
	USY3xTEqyxhYMF/AMhGy3n3bK2HiGnaYAj/9A0kUDaM8ToeH9Sz7+kKrraduUXvsxqwXXF0Xi7BWl
	fMpmUiEJpj8A5TKEUDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6iw-0000000D1m1-24RS;
	Fri, 28 Jun 2024 08:12:50 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6it-0000000D1lf-3FVx
	for linux-snps-arc@lists.infradead.org;
	Fri, 28 Jun 2024 08:12:49 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id 5E7F18C744; Fri, 28 Jun 2024 10:05:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1719561957; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=YJbiW1R0s4g+2UgqPjcQQjz4dMaJm/uD4kFap3G+HDAfDsBwEDLv6IzZNgjfkXAWM
	 1UutdrPC4MQDEar+ogQOI7wB4FtOfDtrA7gWRNMLIU50XFesf06WF5J8HZr0G7/YEX
	 ucLwPyEklVoJTp6n6EBAES8zvVqP5nuDF+HZ4frv0YnwwRI1pjrHJVtbuhjIEYPFH1
	 4+TCwly57Cuie6WF2eHSgVNoBujv+Gln4lVMnhwioE3DfcKkJbaJXphJ8SDvtTyM4l
	 UnXNm7UJ5Tnz0YpzrmeAV6Fr7jzKpRZi1Bykg1JRHOffjrdmTgTo8aeWCo77vBTSq3
	 yC+gNY6nxTIyw==
Received: by mail.quirkbyte.pl for <linux-snps-arc@lists.infradead.org>; Fri, 28 Jun 2024 08:05:09 GMT
Message-ID: <20240628084500-0.1.3v.285os.0.1q04pa5274@quirkbyte.pl>
Date: Fri, 28 Jun 2024 08:05:09 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_011247_959114_F9647546 
X-CRM114-Status: UNSURE (   0.43  )
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

RHppZcWEIGRvYnJ5LAogCkN6eSByb3p3YcW8YWxpIFBhxYRzdHdvIG1vbnRhxbwgc3lzdGVtdSBm
b3Rvd29sdGFpY3puZWdvPwogCkluc3RhbGFjamEgZm90b3dvbHRhaWN6bmEgamVzdCBuYWpsZXBz
enltIHNwb3NvYmVtIG5hIG9ibmnFvGVuaWUgd3lzb2tvxZtjaSByYWNodW5rw7N3IHphIHByxIVk
IChwb3pvc3RhasSFIHR5bGtvIG9wxYJhdHkgc3RhxYJlKSBpIHphYmV6cGllY3plbmllIHNpxJkg
cHJ6ZWQgcm9zbsSFY3ltaSBjZW5hbWkgZW5lcmdpaSBlbGVrdHJ5Y3puZWouIEplc3QgdG8gdyBw
ZcWCbmkgb2RuYXdpYWxuZSBpIGJlemVtaXN5am5lIMW6csOzZMWCbyBlbmVyZ2lpLCBkemnEmWtp
IGN6ZW11IHByenljenluaWFteSBzacSZIGRvIG9jaHJvbnkgxZtyb2Rvd2lza2EgbmF0dXJhbG5l
Z28uCiAKRHppYcWCYW15IG9kIHdpZWx1IGxhdCBuYSByeW5rdSBlbmVyZ2V0eWN6bnltLiBQcnp5
Z290dWplbXkgcHJvamVrdCwgd3ljZW7EmSBvcmF6IGtvbXBsZWtzb3dvIHd5a29uYW15IGkgemfF
gm9zaW15IHJlYWxpemFjasSZIGRvIHpha8WCYWR1IGVuZXJnZXR5Y3puZWdvLiAKIApDenkgY2hj
xIUgUGHFhHN0d28gcG96bmHEhyBuYXN6xIUgcHJvcG96eWNqxJk/ICAKCgpQb3pkcmF3aWFtCk5v
cmJlcnQgS2FyZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zbnBzLWFyYwo=
