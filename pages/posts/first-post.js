import Head from "next/head";
import Link from "next/link";

export default function FirstPost(){
    return ( 
        <>
            <Head>
                <title>First Post</title>
                <meta property="og:title" content="First Post" key="title"/>
            </Head>
            <h1>First Post</h1>
            <h2>
                <Link href="/">
                    <a>Back to home</a>
                </Link>
            </h2>
        </>
    )
}