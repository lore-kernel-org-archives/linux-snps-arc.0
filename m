Return-Path: <SRS0=RPbs=ZN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E33C43215
	for <linux-snps-arc@archiver.kernel.org>; Thu, 21 Nov 2019 00:15:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17F7720730
	for <linux-snps-arc@archiver.kernel.org>; Thu, 21 Nov 2019 00:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EKU37zld";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lny94avW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="PWnOUBhx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17F7720730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkF7a8/EXxf8afuNBlsFqwNuzfqSA+eaLId8AKFdTRc=; b=EKU37zldDBcR1A
	f3B+kNwB3dNmrFyc9Q46bLdRsoI7CGGPnhtt/sPT5+9xuw+46XABT5M4dvlqKLedSIhqJzWbXUnOo
	M8G2ZyfO3KmWxoXARF9BOil78YnWWFoTCQ2aERzvl8rnJse4QMKzVBslVdrHV0Weg4xNDm1wT5ueH
	smkNJTfS1+xwRevBVkTsHNrDduw099kwAj/Dwj/D1Y1Nx06Zm/+u/WFOmZBajF88qswHxeK+LTRgu
	TJKVBUtkMBBmfBHGB7u58JClADST+MrUzVNnMKzWVgH4zeRag9FRiTYnJqVSRxGXv8ben4EAKXTOf
	llILToBNq1SxWCX6+tJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXa7p-0001B9-1K; Thu, 21 Nov 2019 00:15:09 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXa7m-0000T1-5e
 for linux-snps-arc@lists.infradead.org; Thu, 21 Nov 2019 00:15:07 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CBD9BC26A7;
 Thu, 21 Nov 2019 00:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574295304; bh=2PBzgrDhvWZbLkAhO4IVPU8j6IDRV0iOnEKJk7SXbwM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=lny94avWdVK7lLHgx7gf1FQFUptOfX48+oYWTtfODNByNbN/Lnn7DeYRGb22xA1Wg
 QlysxLSAVXU2MHqeBCunqMQjQaauDO7WaOLXJxrfBZDCl1GMBI2p7Qez7rcmX9oLuO
 2sejTrAuKlAoGY9+0HMQDPeKgnvXvpN4Gy8AGFbzfpRx/a/rMDRl3L+JccnbAkt/cq
 qdROcawtueuJsfStd3SfkCHTAYlsUMTZJzSqAwbLpXhPfH2TKJSC4cvwshOZ+Y2lOk
 o0XLTicJdC6R6klQm4cr2sqqtF6sleCjoLEFX9lSiOTsdRCIK3NpbF5d5brJr2gOmE
 tdeJP3S1Ro+RQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 22D21A008E;
 Thu, 21 Nov 2019 00:15:02 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 20 Nov 2019 16:14:50 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 20 Nov 2019 16:14:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B95on52a4U+2BzkxsLWvNPnu0D0Wb+uq4jb9ZJ81Jv/xcNV/l4HbqpmmHIDCG1xF4pgJyPzZlNfGvLa669xRpsyHPD2G/ccOdZv/+wOKtNXvNcAi47iZi1a+1I3L9eXf007QltPvNln5jeQviH2eDRRn5HrOSUZYEOsqtG5CtCQ2nOQN7u0GdjspgDNQ8NH25eU61WeSdiJdwrhDdQ3yEwE5Q3kPbIuO9EK5RFWU4rH8t7K6AN69GEeeSYGm6G9Ff/NgIPb4JqdWGXN1v3XdBWkh3Q/8twRUtHJAL3tjRlRuj1CnLXfCZDaAuvcopZ1FdjScVip7TCe4SB/qvWBr1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PBzgrDhvWZbLkAhO4IVPU8j6IDRV0iOnEKJk7SXbwM=;
 b=VI3WqKHs+FTPZifXdmQqKfobQawOG+U9IBK3D/l29eS0Cw5KBiyX4Gxe6/W6rzNwNU6n7qxQuirFDLW7Tmjr68GWwSKK1B1iXX+oF86nwQrBJnnXdfDxNFze/mM4P4oB3BXLC/yv325zHIF1SbjxWBA4WnToHWYlG/G4tA9va+GWCrlYCO8qAsaEOwGd2GQx0LaRDo1Yo4c+Cp7Kg0zagXJlkrsRtY/O9vZmC0J4a89H8CVdoXagdCx5E+PaDkd0UxQZVVr7BQvWViqk4zVwMMNGrwXDG83/w8g0c1JkvdooBcP3RunGqdge0fe4FWeGjBifccgevUgW5phuutcA9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PBzgrDhvWZbLkAhO4IVPU8j6IDRV0iOnEKJk7SXbwM=;
 b=PWnOUBhxjXueWeBfchFZDxljcHDBMxublKs91Yuandkd0yvb1v/kxOn9ebtUXuTiiXmJvAGWgDDpZghFiE6D7l3u+SYR6FbvU3+D7wPT5tzPiGdamZaPT1wsRCFtS4yLlMi+GoUEwhgP3bujRWitO/wL1/UIONXGicRn7lzvWdA=
Received: from DM6PR12MB4089.namprd12.prod.outlook.com (10.141.184.211) by
 DM6PR12MB3594.namprd12.prod.outlook.com (20.178.31.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Thu, 21 Nov 2019 00:14:48 +0000
Received: from DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::3594:563d:1135:84d8]) by DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::3594:563d:1135:84d8%6]) with mapi id 15.20.2474.018; Thu, 21 Nov 2019
 00:14:48 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "buildroot@busybox.net" <buildroot@busybox.net>
Subject: Re: [PATCH v2] toolchain,glibc: Allow ARC big endian glibc builds
Thread-Topic: [PATCH v2] toolchain,glibc: Allow ARC big endian glibc builds
Thread-Index: AQHVk/9xWYC4UTc+j0ymgfspUqLwOaeU2V6A
Date: Thu, 21 Nov 2019 00:14:48 +0000
Message-ID: <f0b3f253-388b-4c21-d1cd-f1aca81223ae@synopsys.com>
References: <CY4PR1201MB0120ABDDCAB8033A0268CDC1A17E0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20191105173502.11553-1-vgupta@synopsys.com>
In-Reply-To: <20191105173502.11553-1-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe4d74fb-4895-4a48-bf51-08d76e17d1f0
x-ms-traffictypediagnostic: DM6PR12MB3594:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3594C8A0B2D91F56B853A784B64E0@DM6PR12MB3594.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(346002)(136003)(376002)(396003)(199004)(189003)(3846002)(65806001)(4326008)(31696002)(76116006)(86362001)(66066001)(58126008)(66476007)(66446008)(25786009)(66946007)(31686004)(316002)(6116002)(65956001)(110136005)(76176011)(2616005)(5660300002)(53546011)(102836004)(6506007)(6246003)(26005)(186003)(14454004)(54906003)(256004)(7736002)(8676002)(71200400001)(81166006)(2501003)(81156014)(66556008)(6512007)(64756008)(8936002)(478600001)(6486002)(446003)(11346002)(476003)(6436002)(36756003)(486006)(2906002)(305945005)(229853002)(71190400001)(99286004)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR12MB3594;
 H:DM6PR12MB4089.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dccbibSlky2XrwS74WJ/OV3EM/cxAK0TOhqD9VyT5XGnimQdzTvQc8NhR7YWlYDNyiGR+5D/K6mBhGLazavaUrwcSy2KXGOaODgC9kXRPk8g7qsepJf3/Mi75hqSRmuhgqxQwUzlBBx+6mEME3LVWx0YieuxDdPOD8Vwf+sg9Uk8P7gvZLymTtl1Kmx/umXRITxpT3jxpCAOgnw9poB4rYn5RzVLg7FJIEFce1C85c3nxKW8UsHctGJvZmAxqZZP/iDA7qe/vDi1SOrvoB9hl3uifaJORryIK/07/t0Lutj0cUow3Xit43Vy2d+rtS7soBgb67cw2c3dZzrIyAfJEooYjQA3TH12bz/cjjCYPzAeBHow5Ni0n+4d/aDPDBAHWjAA3MY9hlPp0/Kr+MP3QejbQ8L993Wpx6SLEGlmRay1eYnxfymsY5ZMyhArfdFl
Content-ID: <73F434896202C6419A70256E0FB23C62@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4d74fb-4895-4a48-bf51-08d76e17d1f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 00:14:48.0329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eMbrI+MKs0yh27Cos2hJtW5n2ov024ppcDzxoKsgLgWlgQyTa84tSthqBWwsny8GthzrcZSwf+y1wDKpJq4Rig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3594
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_161506_307148_30004CBF 
X-CRM114-Status: GOOD (  16.41  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

ping ^ 2

On 11/5/19 9:35 AM, Vineet Gupta wrote:
> Apparently big endian glibc builds just work, if we let the endian
> header allow that (which prev was #error).
> 
> So this patch bumps glibc to version which fixes the header (this
> hopefully will become arc-2019.09-release) and then enables arceb
> in glibc toolchain builds
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
> Changes since v1
>   - Use BR2_arc iso BR2_arcle && BR2_arcbe
> ---
>  package/glibc/glibc.mk                  | 2 +-
>  toolchain/toolchain-buildroot/Config.in | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index d46063c5d111..754408881397 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  ifeq ($(BR2_arc),y)
> -GLIBC_VERSION =  arc-2019.03-release
> +GLIBC_VERSION = ec681dddfa99894513c85da7d5d257b60d04f915
>  GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
>  else ifeq ($(BR2_RISCV_32),y)
>  GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index c0612bf04176..327314585b8e 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -48,7 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
>  		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
>  		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
> -		   (BR2_arcle && BR2_ARC_ATOMIC_EXT) || BR2_csky
> +		   (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
