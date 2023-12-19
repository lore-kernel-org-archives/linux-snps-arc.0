Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1DCC41535
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Dec 2023 08:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YOE8WhJogGtosYg3kAD0fsluRq9MXuSLa4uuarOhIOo=; b=LeNUsF1gxsk0/f
	DsdiIExm2l3cE07E+o4TfH6cLG5LUkBNz010XXh2umsQr+MihCiUkbR8EoxWKdS4PVs7TYc4UANWj
	9gEZwCb0QWY6hjGS8v5QmzNUqxntjGufQImfwDdNQCq/0YYN/THaYdPPCjUCTmPSTikOsTXq3IPut
	BmPD9u1BduuyDzLmH7Gl2l7s3+GZrT6O2CQN7KD7+eA6lUNjI0aYHnRlYPb3noaLMJ8n89WhrYMHu
	EerLO0aj5ZNnccdRjcQE2i8AEM2hR10YBbu9VsD+xaBf8xNhkBYlc8c/PY4OsVelDTZzMIijM1p16
	kLcAFVWLJ5475OSac86g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFVYT-00DK3g-00;
	Tue, 19 Dec 2023 08:34:21 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFVYP-00DK2y-04
	for linux-snps-arc@lists.infradead.org;
	Tue, 19 Dec 2023 08:34:19 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id 3D85F83A81; Tue, 19 Dec 2023 09:31:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1702974720; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=R6U/VnQnEFzboJub+23tDtCfQ/Zg9sWyUWdszXAcNLhdUx3ntq9V0xNlevBNxbZyG
	 jDARGpXdAq8QC5KMfo0WyP0lPLMeRDaD+i/2qq6AVI3uILTYW30HWoDrSMwMNYwaBw
	 Bx/4DuC+E/+QACeBOjQ0LDR1MsiG0wk6NW+4sRHG1/o0v3KJz9Xx10wN9R8BG5RTBp
	 SusCb5e2JRXTFdw+bYwIOY2WdAdJHSVCV+1rdJiH5raFD3xFVbouQUis4BKkiQhbWF
	 rpFz1lPj//l37RjL7ZhdisySBp8kdFvGbW+e7KkTGO3oojwqBKhQIymbZLMPMp49/L
	 nX2R/z+8ZYjsw==
Received: by mail.quirkbyte.pl for <linux-snps-arc@lists.infradead.org>; Tue, 19 Dec 2023 08:30:16 GMT
Message-ID: <20231219084500-0.1.9.265g.0.pnrk4lc4tk@quirkbyte.pl>
Date: Tue, 19 Dec 2023 08:30:16 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_003417_829431_693F7CAE 
X-CRM114-Status: UNSURE (   1.56  )
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
