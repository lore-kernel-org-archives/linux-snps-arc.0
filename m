Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230CEC0044D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 22:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B0DA2074F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 22:22:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K5DOg55q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eygIoBd7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="XsauH28I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B0DA2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xR9Tf+2jA+qEcO4yc5Xftx0oKLcZiUWLnZ8SRlezvc4=; b=K5DOg55qRSMuxN
	y/hhE32ZioGNhHlvwXOLMZzTTqlizZYmmfd936Caly0zTB3iS9hC0Hk4V7XyY76OmIb8t34JlYSm2
	w3CGVUjL9Mt8zF4WYU3s9fgBrnVhjH62gBOC+TcqFVT5RJatBaU4+c5KSIdIp80HDcQUC60Wkj0uJ
	cMs/xL1jcOZbejX2YcCil2Re7YLcFy+wNPah7w93n4YLBqwhWC3Pb2Rup1iBpjuKCqN9pa8WX+Hv2
	SGY8THziGniC08rPs3Yh7fk6jt4ig4ki5Zw77HH8mK/aSlR7CM7zifbN749VhIMT2hz4tHp2W7GkT
	Xw91+QsoQLoH0TTMJbVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC9k3-0002nG-SN; Wed, 11 Mar 2020 22:22:19 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC9k1-0002mm-Ve
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 22:22:19 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 947EBC0F79;
 Wed, 11 Mar 2020 22:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583965337; bh=XTdsOF3hS0li1jDRp5NoqKXs//PZFIXOwogPA+7UQ8g=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=eygIoBd7X8as8Jq7s5pLi7wU1ZshiqeUOCCNyOuM3InBqU0mBmvLDYxO6mxUVv84D
 /qKVqOpQGl6VVXuMUGkB2TGntvRNFl+Vub/H8dgbsw9XwIXZS6Jqu/MDwKberRnGFP
 hIeu4hkUrbzcjF8aTw8/BUhMB5EMi7JcN86SY1ven2SgvnhCdO81P62oDaFwP0T5az
 bwTY7kFl9YJnPVZ2XjzNjwFtuOgLujzZj6JEbzjwY4YCu//LBOoGu7y9GYDV6ME89g
 +mu/qoIqFsccfsYjKxEcOghBULvrbDHVMBVZoiAEEZY+R9aTkm0cKnKaBEXAPlgUn0
 4KGbXSpNWvCbg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 64A2CA0083;
 Wed, 11 Mar 2020 22:22:17 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 15:22:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 11 Mar 2020 15:22:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AguHEAKOQ/zeUj91voRWQr5tp3HdIcXUiZRQ85oPasogBEfAQhFbkWEa/9xRuu5PCRAi09FXm7A9wwRAJ4K3Ka4JISK9gtP01Mc6t+SUX3PRK0PXctuiLRlD5IEHPiesoTWkopVUx02VOMnMkCxgirMKRXV3adxnBipSonPNjqxEHLU3b66H4eZujzirQtTbzZbl4GBUbA3L3Xuv4X/Uyyvt5UR0wpZgDSI3LITWP9Gl3bKIeUSWRBv7lMetl+mX+L8uvYGh+ZuWkif65tbmy29fRfBMhNA4fuUKK8Wm1/0QyDr+mEX9+RYMRtjPSP7p4BUK1WLFneH8lylu/qYgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTdsOF3hS0li1jDRp5NoqKXs//PZFIXOwogPA+7UQ8g=;
 b=UcLkGBFy+Sqg/4N8yoRLmnHF+AqwVuUSYONLBOlR4/wQHYbODOqqaoXLHF4U8MOwVIvjqpq83qERyszVLVwcvhHKJTyPAABW7MhU/Z6DBDhfPtRx1K3f0x4LxocnfiHi71Z2b8HEl1mD3KnFwkKZlDC6rxwxmsD1U0/wTnNRh1rouszV/CR0WWHT2ladi0UNlm1aCPca14Rd4R1uS9Npu/UhR9Do8t1EIgIM7C0IHV3FDGCGuOfwQCitcmRmKBJ5VbMtNJ4tzdKuzd95W3obTuCF0+H/5/f9dXbirzZdD3xgn84oG6VI80++hs47JRBfcqJWsSqGi3LVLT5CD9hs3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTdsOF3hS0li1jDRp5NoqKXs//PZFIXOwogPA+7UQ8g=;
 b=XsauH28ICEWISlb6IkKsHvBOGCbMtqYO4tU8G8QUqRplHxvppC9fiteX2PabHsCHDDDzlvnAYKN7dYC3Wo+hcetyaK/Wz+Q09JSch+dCGzcozxDvO6ugp1StTnHrn9IWm5inqzbKcUcLAIV3es6Fpez2Ad4Qddy+wMkAgHr++1E=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3493.namprd12.prod.outlook.com (2603:10b6:a03:dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Wed, 11 Mar
 2020 22:21:59 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 22:21:59 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: DJ Delorie <dj@redhat.com>
Subject: Re: How to elf/tst-ldconfig-* in cross test setup
Thread-Topic: How to elf/tst-ldconfig-* in cross test setup
Thread-Index: AQHV9/F2mnc/PSViNEiFGKxkVKa41KhD9PiAgAACHAA=
Date: Wed, 11 Mar 2020 22:21:58 +0000
Message-ID: <e92a698d-1378-5990-d7f8-05c27c5bd689@synopsys.com>
References: <1e5222c2-5e79-1cbe-1bc1-ea1c31f920a3@synopsys.com>
 <xnzhcm4kc4.fsf@greed.delorie.com>
 <59f54822-4b8e-fefb-045d-cbd447e0e72d@synopsys.com>
In-Reply-To: <59f54822-4b8e-fefb-045d-cbd447e0e72d@synopsys.com>
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
x-ms-office365-filtering-correlation-id: b07556dc-3f53-49cc-5b8a-08d7c60a9d94
x-ms-traffictypediagnostic: BYAPR12MB3493:
x-microsoft-antispam-prvs: <BYAPR12MB34933FD2EF3AFC6144D1468EB6FC0@BYAPR12MB3493.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(376002)(136003)(39860400002)(396003)(199004)(2906002)(71200400001)(81166006)(66946007)(81156014)(66476007)(64756008)(66556008)(8676002)(66446008)(186003)(86362001)(76116006)(6486002)(5660300002)(26005)(4326008)(31696002)(6506007)(2616005)(36756003)(6512007)(54906003)(478600001)(53546011)(4744005)(6916009)(8936002)(316002)(31686004)(47845001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3493;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MKzLX+WzcVhqLEmjBYEazZAb9uhHPM8pfzE1sUD/052QkB4Y5Rd0Mvp94zdA7C9YSrXtODQ3wNCfbXnU5DJsU7nUgCJbWRRqYKz/q81oDwWfNZBwM89f356T5QlawdRg+mlxUSO2Pw3o8nJxqutuXih7/wH+U5IgR3NpgfssDR1+RSVI2KxVD1v8JYHSfSyfM86NKKzbfuHOxt9hDXxrAqgByQa51tp6+RqfskUNNLtkXGugth3izbm6ZOfyMLs6r778k/7L7vu3v5W6EW77hhZt3d+fFLdeNM6toyrG/5fgFdmuTF1xLvOh8Zsua0wKUJD3Lq6wA74QNbxfMAdKCGnZsyar6Arws2x4cWC4piW7BY40EL/r9ph5Gn07i65abpeL1BsyAYeeX0+xez6LaVmsZTqNWXwE+R2OfzC6aOpzpFp29LTAgnf2ocijaSSPloEZ5swkkvcg8spM8t/tlDRaRka7f7191vdRqRaEwmeXz3R/wWM4IXirpFX5UmdH
x-ms-exchange-antispam-messagedata: +syluE86c8cxchqCa6EgRaYkGmncxO+PoIc9OZd0tfZXx9lrp58I5lE+F8G14M4ridV6M021EWNAFeWLu3Ts5kJ/rcMe1tK/ceqOO/Mk4BT9z4u5boCL80TB8ywVxXEZsuGKzrSqNu85muTb+QDcuQ==
x-ms-exchange-transport-forked: True
Content-ID: <E36BF464B22EFD488DF87B97BBD14F0F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b07556dc-3f53-49cc-5b8a-08d7c60a9d94
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 22:21:59.0183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UTH6aMVd8lOnQm4cwX7ZdRM8cbrqYUsrS52s4PtuRL6th7rlxzAdAUsYKdjy+P9s8q8taHL+jDp4C28o9+Pi6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3493
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_152218_089897_8730B0FA 
X-CRM114-Status: GOOD (  10.43  )
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
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "ahajkova@redhat.com" <ahajkova@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/11/20 3:14 PM, Vineet Gupta wrote:
>> The containerized tests are (in this case) containerized because they
>> rely on setup files (like /etc/ld.so.conf) inside the container to run
>> the test.  Otherwise you end up corrupting the host OS.
>>
>> The test infrastructure knows how to run containerized tests on remote
>> machines, though... any reason why you're not using that setup?
> I was using that setup all along: this was my original host cmdline:
> 
> $ make test-wrapper='<full path
> to>/br/build/glibc-867196a7635/scripts/cross-test-ssh.sh root@192.168.0.20' xcheck
> subdirs=elf

FWIW the original failures were here

  lock_fd = open (concat (pristine_root_path, "/lock.fd", NULL),
		 O_CREAT | O_TRUNC | O_RDWR, 0666);
  if (lock_fd < 0)
    FAIL_EXIT1 ("Cannot create testroot lock.\n");   <----
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
