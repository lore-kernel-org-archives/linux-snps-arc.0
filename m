Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE50EC2BA15
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Jun 2024 07:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YOE8WhJogGtosYg3kAD0fsluRq9MXuSLa4uuarOhIOo=; b=eIBxAIrlYBNgVT
	ivRIBi2Ta9MIKDugSc/ReW4RQ7CuKVmUY1IcHRkwrQYvmbhyzsQd4wQ2aSn+RGskFJTeXKWQLvGsT
	Faz6rcedmch3tJ3h6DwUKbTmyCJcua2lpIWG7cPBSvKxgovo1SBGRbAKipGayXqa8iwDxuorcOSvN
	EE58aAMO698tGsrMCbC2YFibGGkDezFeCfJoURIF3eTj9l6TIi5iLP5sSEeErC/3vVRRQrxNWKW34
	l2KwtSkNsAF2wH/IMMKXkeLiUCkq5lnuMDv5fmnpKOXu39loAu71BSPw9qTOJ30qlChGcF8QX3l7N
	ZA6Xu/zCQ2zoPlgHfVqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJqBq-00000000IP3-1VEA;
	Wed, 19 Jun 2024 07:57:10 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJqBl-00000000INn-4C6P
	for linux-snps-arc@lists.infradead.org;
	Wed, 19 Jun 2024 07:57:07 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id CE516878C4; Wed, 19 Jun 2024 09:56:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1718783816; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=2R9KHhJEoUDIyzLK8hO+W/LW2vnAc9S4ibBRZ2de8nLlT9gjgfm1EgHEcJS1YbgHq
	 l6sbNeL5F/clbA4cafh4qJdh105h5wNoDRsrjev8n5TqhM1GKZr4sh0OhBWchQNTAk
	 coKKBlVNYs7u0+HlK/RVVnLne0d6P3CAl3KxcfhUVNo87pkxM1AvU5GJdQZ87qGyt3
	 vDXdBQrcGYBdn+xM2hLRXv72BlHk3PKhsd/+qNhApvaqYJ/AEfmit6as2ygLXF5gax
	 a6CJxXlyJOc8t42qLQjbI2EiDWUI+GNvoDEwYMJztakriQhPlWW1EcXDtEX6yxyDs7
	 B+8osCW/UTdxA==
Received: by mail.quirkbyte.pl for <linux-snps-arc@lists.infradead.org>; Wed, 19 Jun 2024 07:55:12 GMT
Message-ID: <20240619084500-0.1.3o.23lcl.0.gc44hu0pkq@quirkbyte.pl>
Date: Wed, 19 Jun 2024 07:55:12 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_005706_390551_E8C1661C 
X-CRM114-Status: UNSURE (   0.87  )
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
